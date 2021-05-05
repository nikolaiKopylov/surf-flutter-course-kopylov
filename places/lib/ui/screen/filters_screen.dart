import 'package:flutter/material.dart';
import 'package:places/domain/category.dart';
import 'package:places/domain/category.dart';
import 'package:places/domain/filter.dart';
import 'package:places/ui/screen/sight_list_screen.dart';
import 'filters_screen/filters_screen_widget.dart';
import 'package:places/ui/constants.dart';
import 'package:places/ui/styles/text_styles.dart';

/// FiltersScreen - экран отображения фильтрации  SightCard
class FiltersScreen extends StatefulWidget {
  final Filter filter;
  FiltersScreen({Key key, this.filter}) : super(key: key);
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  final activeFilters = <Category>{};
  Filter _filter;

  @override
  void initState() {
    _filter = widget.filter;

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
                  },
                );
              }),
          DistanceSlider(
            onRadius: (value) => _filter.searchRadius = value,
          ),
          Expanded(
            child: SizedBox(height: 152.0),
          ),
          FilterScreenButton(
            count: activeFilters.length,
            onPressed: onPressFilterButon(),
          )
        ],
      ),
    );
  }

  onPressFilterButon() {
    _filter.category = activeFilters.toList();

    Navigator.of(context).pop(_filter);
  }
}
