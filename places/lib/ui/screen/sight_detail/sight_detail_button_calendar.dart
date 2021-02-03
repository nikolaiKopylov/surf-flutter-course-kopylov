import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/styles/text_styles.dart';
import '../../constants.dart';

/// SightDetailButtonCalendar - button for planning a visit
class SightDetailButtonCalendar extends StatelessWidget {
  final Sight sight;

  const SightDetailButtonCalendar({
    Key key,
    @required this.sight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton.icon(
      icon: SvgPicture.asset(
        AppIcons.iconCalendar,
        color: Theme.of(context).iconTheme.color,
      ),
      label: Text(
        AppTexts.addPlan,
        style: Theme.of(context).textTheme.headline5,
      ),
      minWidth: 164.0,
      height: 40.0,
      onPressed: () {
        print('SightDetail - press ButtonCalendar');
      },
    );
  }
}
