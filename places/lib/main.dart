import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screen/add_sight_screen.dart';
import 'package:places/ui/screen/filters_screen.dart';
import 'package:places/ui/screen/settings_screen.dart';
import 'package:places/ui/screen/sight_list_screen.dart';
import 'package:places/ui/screen/sight_search_screen.dart';
import 'package:places/ui/widget/theme_controller.dart';
import 'ui/screen/sight_detail.dart';
import 'ui/screen/visiting_screen.dart';
import 'ui/screen/res/themes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<ThemeController>(
      create: (_) => ThemeController(isDark: false),
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: context.watch<ThemeController>().getTheme(),
      home: //VisitingScreen(),
          //    SightListScreen(), //
          //     SightDetail(
          //  sight: mocks[0],
          //),
          //  FiltersScreen(),
          // SettingsScreen(),
          //AddSightScreen(),
          SightSearchScreen(),
      title: 'Places',
    );
  }
}
