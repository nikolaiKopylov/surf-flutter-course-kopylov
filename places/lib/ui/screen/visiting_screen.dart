import 'package:flutter/material.dart';
import 'package:places/ui/constants.dart';
import 'package:places/ui/styles/text_styles.dart';
import 'package:places/ui/widget/custom_tab_bar.dart';

import '../../mocks.dart';
import 'sight_card_visited.dart';
import 'sight_card_want_visit.dart';
import 'package:places/ui/widget/bottom_navigation_view.dart';

// VisitingScreen - экран "Хочу посетить / Посещенные места"
class VisitingScreen extends StatefulWidget {
  @override
  _VisitingScreenState createState() => _VisitingScreenState();
}

class _VisitingScreenState extends State<VisitingScreen> {
  int tabIndex;
  Color tabColor;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          toolbarHeight: 108.0,
          centerTitle: true,
          title: Text(
            AppTexts.favorites,
            //style: AppTextStyles.textStyleDetailTitle,
          ),
          //  backgroundColor: AppColorsLight.background,
          bottom: CustomTabBar(),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Column(
                children: mocks
                    .map((item) => SightCardWantVisit(
                          sight: item,
                        ))
                    .toList(),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: mocks
                    .map((item) => SightCardVisited(
                          sight: item,
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationView(),
      ),
    );
  }
}
