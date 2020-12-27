import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/styles/text_styles.dart';
import '../../constants.dart';

/// Заглушка для кнопки "Построить маршрут "
///

class SightDetailButtonGo extends StatelessWidget {
  final Sight sight;

  const SightDetailButtonGo({
    Key key,
    @required this.sight,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(
            top: 24.0,
            bottom: 24.0,
          ),
          width: 328.0,
          height: 48.0,
          color: AppColors.green,
        ),
        Positioned(
          top: 15.0,
          bottom: 15.0,
          left: 67.0,
          child: Container(
            width: 20.0,
            height: 18.0,
            child: Image.asset('res/icon/icon_go.png'),
          ),
        ),
        Positioned(
          top: 15.0,
          bottom: 15.0,
          right: 66.0,
          child: Text(
            AppTexts.createRoute,
            style: AppTextStyles.textStyleDetailWhite,
          ),
        ),
      ],
    );
  }
}
