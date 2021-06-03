import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
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

  List<Sight> visitingList = [mocks[0], mocks[2], mocks[3]];
  List<Sight> wantVisitList = [mocks[1], mocks[3], mocks[4]];
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
            style: AppTextStyles.textStyleDetailTitle,
          ),
          //  backgroundColor: AppColorsLight.background,
          bottom: CustomTabBar(),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              itemCount: wantVisitList.length,
              itemBuilder: (context, index) => SightCardWantVisit(
                  key: ObjectKey(
                    wantVisitList[index],
                  ), // так как некоторые поля могут совпадать , а ObjectKey по Sight по идее уникальный
                  sight: wantVisitList[index],
                  deleteWantVisitCard: () {
                    print(ObjectKey(
                      wantVisitList[index],
                    ));
                    deleteCard(wantVisitList[index], wantVisitList);
                  }),
            ),
            ListView.builder(
              itemCount: visitingList.length,
              itemBuilder: (context, index) => SightCardVisited(
                  key: ObjectKey(
                    visitingList[index],
                  ), // так как некоторые поля могут совпадать , а ObjectKey по Sight по идее уникальный
                  sight: visitingList[index],
                  deleteVisitedCard: () {
                    deleteCard(visitingList[index], visitingList);
                  }),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationView(),
      ),
    );
  }

  void deleteCard(Sight sight, List<Sight> listSight) {
    setState(() {
      listSight.removeWhere((element) => sight == element);
    });
  }
}
