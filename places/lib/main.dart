import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screen/sight_list_screen.dart';
import 'ui/screen/sight_detail.dart';
import 'ui/screen/visiting_screen.dart';
import 'ui/screen/res/themes.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      home: //VisitingScreen(),
          //SightListScreen(), //
          SightDetail(
        sight: mocks[0],
      ),
      title: 'FirstApp',
    );
  }
}
