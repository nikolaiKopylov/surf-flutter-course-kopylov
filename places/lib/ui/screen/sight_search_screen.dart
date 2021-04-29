import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screen/sight_detail.dart';
import 'package:places/ui/screen/util/utils.dart';
import 'package:places/ui/widget/custom_app_bar.dart';
import 'package:places/ui/widget/search_bar.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class SightSearchScreen extends StatefulWidget {
  @override
  _SightSearchScreenState createState() => _SightSearchScreenState();
}

class _SightSearchScreenState extends State<SightSearchScreen> {
  TextEditingController controller;
  List<Sight> listSight;
  List<Sight> listSightSearch;
  // стрим, в котором данные результата завпроса
  StreamController<List<Sight>> streamController;
  // подписка на текущий стрим
  StreamSubscription<List> streamSubscription;
  // флаг загрузки данных
  bool _isLoading = false;

  final SearchHistory _searchHistory = SearchHistory();

  @override
  void initState() {
    super.initState();
    listSight = mocks;
    controller = TextEditingController();
    streamController = StreamController();
  }

  @override
  void dispose() {
    controller.dispose();
    streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        bottom: SearchBar(
          readOnly: false,
          searchController: controller,
          onChange: (_) async {
            onSearch(controller.text);
          },
          onClear: (_) async {
            onClear();
            print('''''' '''''' '');
            print(controller.text);
            setState(() {});
          },
        ),
      ),
      body: Column(
        children: [
          if (_isLoading)
            SizedBox(
              height: 40.0,
              width: 40.0,
              child: CircularProgressIndicator(),
            ),
          Expanded(
              child: StreamBuilder<List<Sight>>(
            stream: streamController.stream,
            builder: (context, snapshot) {
              if (snapshot.hasData && !snapshot.hasError) {
                if (snapshot.data.isNotEmpty) {
                  return searchList(snapshot.data);
                } else
                  return CenterMessage();
              }
              if (snapshot.hasError) {
                return CenterMessage();
              }
              return HistoryList(
                searchHistory: _searchHistory,
                onSelect: (value) {
                  controller.text = value;
                  onSearch(value);
                },
              );
            },
          ))
        ],
      ),
    );
  }

  Future<void> onClear() async {
    controller.clear();
    onSearch(controller.text);
    streamController.add(null);
    print('Clear');
  }

  // функция возвращает список результатов поиска
  Future<List<Sight>> search(String value) async {
    final result = listSight.where((sight) =>
        sight.name.toLowerCase().contains(value.trim().toLowerCase()));
    print('$value');
    print(result.toList());
    return result.toList();
  }

  // вывод результатов поиска списком
  Widget searchList(List<Sight> listValue) {
    return SingleChildScrollView(
      child: Column(
        children: listValue
            .map((item) => SearchResultItem(
                  sight: item,
                  onTap: () async {
                    await Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SightDetail(sight: item),
                    ));
                  },
                ))
            .toList(),
      ),
    );
  }

  // функция поиска
  Future<void> onSearch(String value) async {
    if (value != '') {
      setLoading(true);
      streamSubscription?.cancel();
      streamSubscription = search(value).asStream().listen((event) {
        setLoading(false);
        streamController.sink.add(event);
        //добавляем в историю  поиска запросы
        _searchHistory.add(value);
      }, onError: (error) {
        setLoading(false);
        streamController.addError(error);
      });
    }
  }

  void setLoading(bool isLoading) {
    setState(() {
      _isLoading = isLoading;
    });
  }
}

/// [SearchResultItem] вывод результатов поиска
class SearchResultItem extends StatelessWidget {
  final Sight sight;
  final Function onTap;

  const SearchResultItem({
    Key key,
    this.sight,
    this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(sight.name),
      subtitle: Text(
        sight.type,
      ),
      onTap: onTap,
      leading: Container(
        width: 56.0,
        height: 56.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(
              12.0,
            ),
          ),
          image: DecorationImage(
            image: Image.network(
              sight.url,
              loadingBuilder: buildImageProgressIndicator,
            ).image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

/// [CenterMessage] сообщение при ошибке поиска
class CenterMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color color = AppColorsDark.inactiveBlack;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(53.2),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                AppIcons.iconSearch,
                height: 50,
                width: 50,
                color: color,
              ),
              SizedBox(
                height: 32.0,
              ),
              Text(
                AppTexts.notSearch,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline2
                    .copyWith(color: color),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                AppTexts.editSearchParams,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    .copyWith(color: color),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SearchHistory {
  final List<String> _requests = [];

  List<String> get list => _requests;

  // добавление записи в историю запросов
  // удаляем если есть такой же и ставим в начало списка
  void add(String request) {
    _requests.removeWhere((element) => element == request);
    _requests.insert(0, request);
    print(request);
  }

  // очистить историю
  void clear() {
    _requests.clear();
  }

  // удалить запись из стории
  void remove(int index) {
    _requests.removeAt(index);
  }
}

class HistoryList extends StatefulWidget {
  final SearchHistory searchHistory;
  final ValueChanged<String> onSelect;

  const HistoryList({
    Key key,
    this.searchHistory,
    this.onSelect,
  }) : super(key: key);
  @override
  _HistoryListState createState() => _HistoryListState();
}

class _HistoryListState extends State<HistoryList> {
  List<String> list = [];

  @override
  void initState() {
    super.initState();
    list = widget.searchHistory.list;
  }

  @override
  Widget build(BuildContext context) {
    if (list.isEmpty) {
      return Center(child: Text('история пуста'));
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            AppTexts.titleHistory.toUpperCase(),
            style: Theme.of(context).textTheme.headline4,
          ),
          ListView.separated(
              itemBuilder: (context, index) => HistoryItem(
                    title: list[index],
                    onTap: () => widget.onSelect(list[index]),
                    onDelete: () => onDeleteItem(index),
                  ),
              separatorBuilder: (context, index) => Divider(),
              itemCount: list.length),
          TextButton(
            onPressed: onClearHistory,
            child: Text(AppTexts.clearHistory),
          )
        ],
      ),
    );
  }

  void onClearHistory() {
    widget.searchHistory.clear();
    setState(() {
      list = widget.searchHistory.list;
    });
  }

  void onDeleteItem(int index) {
    widget.searchHistory.remove(index);
    setState(() {
      list = widget.searchHistory.list;
    });
  }
}

// Элемент истории с кнопкеой удаления
class HistoryItem extends StatelessWidget {
  final String title;
  final Function onTap;
  final Function onDelete;

  const HistoryItem({
    Key key,
    this.title,
    this.onTap,
    this.onDelete,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyText2,
      ),
      trailing: IconButton(
        icon: SvgPicture.asset(AppIcons.iconClose),
        onPressed: onDelete,
      ),
      onTap: onTap,
    );
  }
}
