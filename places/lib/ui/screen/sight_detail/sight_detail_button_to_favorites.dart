import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/domain/sight.dart';
import '../../constants.dart';

/// SightDetailButtonToFavorites - add to favorites button
class SightDetailButtonToFavorites extends StatelessWidget {
  final Sight sight;

  const SightDetailButtonToFavorites({
    Key key,
    @required this.sight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton.icon(
      icon: SvgPicture.asset(
        AppIcons.iconHeart,
        color: Theme.of(context).iconTheme.color,
      ),
      label: Text(
        AppTexts.toFavorites,
        style: Theme.of(context).textTheme.headline5,
      ),
      minWidth: 164.0,
      height: 40.0,
      onPressed: () {
        print('SightDetail - press ButtonToFavorites');
      },
    );
  }
}
