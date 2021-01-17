import 'package:flutter/material.dart';
import 'package:places/ui/constants.dart';
import 'package:places/ui/styles/text_styles.dart';

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
          toolbarHeight: 108.0,
          centerTitle: true,
          title: Text(
            AppTexts.favorites,
            style: AppTextStyles.textStyleDetailTitle,
          ),
          backgroundColor: AppColors.greyBackground,
          bottom: TabBar(
            unselectedLabelColor: AppColors.grey2,
            labelColor: AppColors.white,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: AppColors.black,
            ),
            tabs: [
              Tab(
                child: Text(
                  AppTexts.wantVisit,
                ),
              ),
              Tab(
                child: Text(
                  AppTexts.visited,
                ),
              ),
            ],
          ),
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
