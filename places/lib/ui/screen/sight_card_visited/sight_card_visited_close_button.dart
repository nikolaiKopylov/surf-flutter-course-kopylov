import 'package:flutter/material.dart';

import '../../constants.dart';

/// SightCardVisitedCloseButton - button close visited sight card
class SightCardVisitedCloseButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 24,
      onPressed: () {
        print('SightCardVisited - press Close button ');
      },
      icon: Image.asset(AppIcons.iconClose),
      visualDensity: VisualDensity.compact,
    );
  }
}
