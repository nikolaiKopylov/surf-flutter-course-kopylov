import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants.dart';

/// SightCardFavoriteButton - button add to favorite sight
class SightCardFavoriteButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 24,
      onPressed: () {
        print('SightCard - press favorte button ');
      },
      icon: SvgPicture.asset(
        AppIcons.iconHeart,
      ),
      visualDensity: VisualDensity.compact,
    );
  }
}
