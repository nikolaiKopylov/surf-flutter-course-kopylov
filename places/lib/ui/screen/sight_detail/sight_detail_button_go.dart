import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/styles/text_styles.dart';
import '../../constants.dart';

/// SightDetailButtonGo - button building a route to a sight
class SightDetailButtonGo extends StatelessWidget {
  final Sight sight;

  const SightDetailButtonGo({
    Key key,
    @required this.sight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton.icon(
      icon: Image.asset(AppIcons.iconGo),
      label: Text(
        AppTexts.createRoute,
        style: Theme.of(context).textTheme.button,
      ),
      minWidth: 328.0,
      height: 48.0,
      color: Theme.of(context).buttonColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      onPressed: () {
        print('SightDetail - press ButtonGo');
      },
    );
  }
}
