import 'package:flutter/material.dart';

import '../../constants.dart';

/// SightCardWantVisit - button close want visit sight card
class SightCardWantVisitCloseButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 24,
      onPressed: () {
        print('SightCardWantVisit - press Close button ');
      },
      icon: Image.asset(AppIcons.iconClose),
      visualDensity: VisualDensity.compact,
    );
  }
}
