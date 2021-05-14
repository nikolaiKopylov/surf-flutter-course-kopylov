import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants.dart';

/// SearchHistory - история поиска
/// операции [add] , [clear], [remove]
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

/// [HistoryList] - widget вывод списка истории поиска
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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 38.0),
            Text(
              AppTexts.titleHistory.toUpperCase(),
              style: Theme.of(context).textTheme.headline4,
            ),
            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
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
      ),
    );
  }

  /// Осичтка истории поиска
  void onClearHistory() {
    widget.searchHistory.clear();
    setState(() {
      list = widget.searchHistory.list;
    });
  }

  /// удаление одной записи из истории поиска
  void onDeleteItem(int index) {
    widget.searchHistory.remove(index);
    setState(() {
      list = widget.searchHistory.list;
    });
  }
}

// Элемент истории с кнопкой удаления
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
        icon: SvgPicture.asset(
          AppIcons.iconClose,
          color: Theme.of(context).brightness == Brightness.dark
              ? AppColorsDark.inactiveBlack
              : AppColorsLight.inactiveBlack,
        ),
        onPressed: onDelete,
      ),
      onTap: onTap,
    );
  }
}
