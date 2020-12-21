import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/constants.dart';
import 'package:places/ui/screen/sight_card.dart';
import 'package:places/ui/styles/text_styles.dart';

import '../../mocks.dart';

/// Экран отображени списка интересных мест

class SightListScreen extends StatefulWidget {
  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    var item;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        toolbarHeight: 72.0,
        title: Text(
          AppTexts.appHeader,
          style: AppTextStyles.textStyleAppBarBlack,
          textAlign: TextAlign.start,
          maxLines: 2,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: mocks
              .map((item) => SightCard(
                    sight: item,
                  ))
              .toList(),
        ),
      ),
    );
  }
}
