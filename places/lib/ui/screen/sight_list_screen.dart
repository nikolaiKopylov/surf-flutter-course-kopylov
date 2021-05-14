import 'package:flutter/material.dart';
import 'package:places/domain/filter.dart';
import 'package:places/domain/search_radius.dart';
import 'package:places/ui/screen/filters_screen.dart';

import 'package:places/ui/screen/sight_card.dart';
import 'package:places/ui/screen/sight_search_screen.dart';
import 'package:places/ui/widget/add_sight_button.dart';
import 'package:places/ui/widget/custom_app_bar.dart';
import 'package:places/ui/widget/search_bar.dart';
import '../../mocks.dart';
import 'package:places/ui/widget/bottom_navigation_view.dart';

/// Экран отображения списка интересных мест
class SightListScreen extends StatefulWidget {
  const SightListScreen({Key key}) : super(key: key);
  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  Filter filter = Filter(
      searchRadius: SearchRadius(startValue: 4000, endValue: 8000),
      category: filterList);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          bottom: SearchBar(
        readOnly: true,
        filter: filter,
        onFilterTap: _onFilterTap,
        onSearchTap: _onSearchTap,
      )),
      body: SingleChildScrollView(
        child: Column(
          children: mocks
              .map((item) => SightCard(
                    sight: item,
                  ))
              .toList(),
        ),
      ),
      floatingActionButton: AddSightButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: BottomNavigationView(),
    );
  }

  Future<void> _onFilterTap() async {
    final Filter newFilter = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FiltersScreen(
          filter: filter,
        ),
      ),
    );

    // Обновляем в соответствии с новым фильтром
    setState(() {
      filter = newFilter;
    });
  }

  Future<void> _onSearchTap() async {
    print('press filters in searh');
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SightSearchScreen(
          filter: filter,
        ),
      ),
    );
  }
}
