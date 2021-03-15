import 'package:flutter/material.dart';
import 'package:places/domain/filter.dart';
import 'filters_screen/filters_screen_widget.dart';
import 'package:places/ui/constants.dart';
import 'package:places/ui/styles/text_styles.dart';

/// FiltersScreen - экран отображения фильтрации  SightCard
class FiltersScreen extends StatefulWidget {
  FiltersScreen({Key key}) : super(key: key);
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  final activeFilters = <Filter>{};
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
          onPressed: () {
            print('press Back');
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
          DistanceSlider(),
          Expanded(
            child: SizedBox(height: 152.0),
          ),
          FilterScreenButton(
            count: activeFilters.length,
          )
        ],
      ),
    );
  }
}
