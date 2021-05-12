import 'package:flutter/material.dart';
import 'package:places/domain/category.dart';
import 'package:places/domain/filter.dart';
import 'package:places/domain/search_radius.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screen/sight_list_screen.dart';
import 'filters_screen/filters_screen_widget.dart';
import 'package:places/ui/constants.dart';
import 'package:places/ui/styles/text_styles.dart';

/// FiltersScreen - экран отображения фильтрации  SightCard
class FiltersScreen extends StatefulWidget {
  final Filter filter;
  FiltersScreen({
    Key key,
    this.filter,
  }) : super(key: key);
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  final activeFilters = <Category>{};
  Filter _filter = Filter();
  List<Sight> _listSight;
  List<Category> _categories;
  SearchRadius _searchRadius;
  int countSight = 0;

  @override
  void initState() {
    _filter = widget.filter;
    _listSight = mocks;
    _searchRadius = SearchRadius(startValue: 4000, endValue: 8000);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        toolbarHeight: 56,
        elevation: 0,
        leading: IconButton(
          color: Theme.of(context).primaryColor,
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            size: 24,
          ),
          onPressed: () async {
            await Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => SightListScreen(),
            ));
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                activeFilters.clear();
                onCheckCount();
              });
            },
            child: Text(
              AppTexts.clear,
              style: AppTextStyles.text.copyWith(
                color: Theme.of(context).buttonColor,
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          CategoryFilters(
              activeFilters: activeFilters,
              onPressed: (filter) {
                setState(
                  () {
                    if (activeFilters.contains(filter)) {
                      activeFilters.remove(filter);
                    } else {
                      activeFilters.add(filter);
                    }
                    onCheckCount();
                  },
                );
              }),
          DistanceSlider(
            onRadius: (value) {
              setState(() {
                _searchRadius = value;
                onCheckCount();
              });
            },
          ),
          Expanded(
            child: SizedBox(height: 152.0),
          ),
          FilterScreenButton(
            count: countSight, //activeFilters.length,
            onPressed: () => onPressFilterButon(),
          )
        ],
      ),
    );
  }

  // Срабатывает при нажатии на [FilterScreenButton]
  Future<void> onPressFilterButon() async {
    /* if (activeFilters.isNotEmpty) {
      _categories = activeFilters.toList();
    } else
      _categories = filterList;

    _filter = Filter(category: _categories, searchRadius: _searchRadius);
    */
    Navigator.of(context).pop(_filter);
  }

  ///Проверяет на выбранные категории
  ///формирует фильтр [Filter]
  ///заполняет количество отфильтрованных записей [countSight] для отображения на [FilterScreenButton]
  Future<void> onCheckCount() async {
    if (activeFilters.isNotEmpty) {
      _categories = activeFilters.toList();

      _filter = Filter(category: _categories, searchRadius: _searchRadius);
      countSight = filteredSightList(_listSight, currentPoint, _filter).length;
    } else
      countSight = 0;
  }
}
