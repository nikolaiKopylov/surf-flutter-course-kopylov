import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/domain/filter.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screen/sight_detail.dart';
import 'package:places/ui/screen/util/utils.dart';
import 'package:places/ui/widget/custom_app_bar.dart';
import 'package:places/ui/widget/search_bar.dart';
import 'package:provider/provider.dart';
import 'sight_search_screen/search_result_widget.dart';

import '../constants.dart';

/// SightSearchScreen - экран поиска интересных мест
class SightSearchScreen extends StatefulWidget {
  final Filter filter;

  const SightSearchScreen({
    Key key,
    this.filter,
  }) : super(key: key);
  @override
  _SightSearchScreenState createState() => _SightSearchScreenState();
}

class _SightSearchScreenState extends State<SightSearchScreen> {
  TextEditingController textController;
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
    textController = TextEditingController();
    streamController = StreamController();
  }

  @override
  void dispose() {
    textController.dispose();
    streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isBackVisible: true,
        bottom: SearchBar(
          readOnly: false,
          searchController: textController,
          onSubmitted: (_) async {
            onSearch(textController.text);
          },
          onChange: (_) async {
            var value = textController.text;
            if (value.endsWith(' ')) {
              onSearch(value);
              print('value $value');
            }
          },
          onClear: () => onClear(),
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
                  print(snapshot.error);
                  return CenterMessage();
                }
                return HistoryList(
                  searchHistory: _searchHistory,
                  onSelect: (value) {
                    textController.text = value;
                    onSearch(value);
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }

  // очистка текстового поля поиска
  void onClear() async {
    textController.clear();
    onSearch(textController.text);
    streamController.sink.add(null);
    print('_searchHistory $_searchHistory');
    print('Clear');
  }

  // функция возвращает список результатов поиска
  Future<List<Sight>> search(String value) async {
    final listFilteredSight =
        filteredSightList(listSight, currentPoint, widget.filter);

    final result = listFilteredSight.where((sight) =>
        sight.name.toLowerCase().contains(value.trim().toLowerCase()));
    return result.toList();
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
        _searchHistory.add(value.trim());
      }, onError: (error) {
        setLoading(false);
        streamController.addError(error);
      });
    }
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

  // индикатор выполнения запроса загрузки данных
  void setLoading(bool isLoading) {
    setState(() {
      _isLoading = isLoading;
    });
  }
}
