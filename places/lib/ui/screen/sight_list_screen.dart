import 'package:flutter/material.dart';

import 'package:places/ui/screen/sight_card.dart';
import 'package:places/ui/widget/add_sight_button.dart';
import 'package:places/ui/widget/custom_app_bar.dart';
import 'package:places/ui/widget/search_bar.dart';
import '../../mocks.dart';
import 'package:places/ui/widget/bottom_navigation_view.dart';

/// Экран отображения списка интересных мест
class SightListScreen extends StatefulWidget {
  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(bottom: SearchBar(readOnly: true)),
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
}
