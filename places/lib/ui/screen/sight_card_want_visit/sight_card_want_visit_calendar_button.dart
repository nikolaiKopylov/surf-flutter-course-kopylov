import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      icon: SvgPicture.asset(
        AppIcons.iconCalendar,
      ),
      visualDensity: VisualDensity.compact,
    );
  }
}
