import 'package:flutter/material.dart';

import '../../constants.dart';

/// SightCardVisitedShareButton - button Share visited sight card
class SightCardVisitedShareButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 24,
      onPressed: () {
        print('SightCardVisited - press Share button ');
      },
      icon: Image.asset(AppIcons.iconShare),
      visualDensity: VisualDensity.compact,
    );
  }
}
