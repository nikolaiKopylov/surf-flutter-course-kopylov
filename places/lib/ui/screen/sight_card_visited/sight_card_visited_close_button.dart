import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants.dart';

/// SightCardVisitedCloseButton - button close visited sight card
class SightCardVisitedCloseButton extends StatelessWidget {
  final Function deleteVisitedCard;

  const SightCardVisitedCloseButton({
    Key key,
    this.deleteVisitedCard,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 24,
      onPressed: deleteVisitedCard,
      icon: SvgPicture.asset(
        AppIcons.iconClose,
      ),
      visualDensity: VisualDensity.compact,
    );
  }
}
