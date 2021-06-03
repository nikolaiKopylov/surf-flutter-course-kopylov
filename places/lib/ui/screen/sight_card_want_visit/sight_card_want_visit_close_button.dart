import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants.dart';

/// SightCardWantVisit - button close want visit sight card
class SightCardWantVisitCloseButton extends StatelessWidget {
  final Function deleteWantVisitCard;

  const SightCardWantVisitCloseButton({
    Key key,
    @required this.deleteWantVisitCard,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 24,
      onPressed: deleteWantVisitCard,
      icon: SvgPicture.asset(
        AppIcons.iconClose,
      ),
      visualDensity: VisualDensity.compact,
    );
  }
}
