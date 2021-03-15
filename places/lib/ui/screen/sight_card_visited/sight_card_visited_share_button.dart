import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      icon: SvgPicture.asset(
        AppIcons.iconShare,
      ),
      visualDensity: VisualDensity.compact,
    );
  }
}
