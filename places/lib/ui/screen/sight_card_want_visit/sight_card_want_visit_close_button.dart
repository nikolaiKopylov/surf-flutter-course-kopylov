import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      icon: SvgPicture.asset(
        AppIcons.iconClose,
      ),
      visualDensity: VisualDensity.compact,
    );
  }
}
