import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/styles/text_styles.dart';
import '../../constants.dart';

/// Заглушка для кнопки "Календарь "
///
class SightDetailButtonCalendar extends StatelessWidget {
  final Sight sight;

  const SightDetailButtonCalendar({
    Key key,
    @required this.sight,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: 164.0,
        height: 40.0,
        color: AppColors.greyDriver,
      ),
      Positioned(
        top: 10.5,
        bottom: 10.5,
        left: 17.0,
        child: Container(
          width: 20.0,
          height: 18.0,
          child: Image.asset('res/icon/icon_calendar.png'),
        ),
      ),
      Positioned(
        top: 11.0,
        bottom: 11.0,
        right: 14.0,
        child: Text(
          AppTexts.addPlan,
          style: AppTextStyles.textStyleDetailWhite,
        ),
      ),
    ]);
  }
}
