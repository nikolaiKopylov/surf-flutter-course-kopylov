import 'package:flutter/material.dart';

import '../../constants.dart';

/// SightCardWantVisitCalendarButton - button add to calendar sight card
class SightCardWantVisitCalendarButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 24,
      onPressed: () {
        print('SightCardWantVisit - press Calendar button ');
      },
      icon: Image.asset(AppIcons.iconCalendarWhite),
      visualDensity: VisualDensity.compact,
    );
  }
}
