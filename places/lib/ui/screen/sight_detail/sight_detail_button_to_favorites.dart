import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/styles/text_styles.dart';
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
      icon: Image.asset(AppIcons.iconHeartDark),
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
