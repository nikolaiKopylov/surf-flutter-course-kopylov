import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/styles/text_styles.dart';
import '../../constants.dart';

/// Заглушка для кнопки "В избранное"
///

class SightDetailButtonToFavorites extends StatelessWidget {
  final Sight sight;

  const SightDetailButtonToFavorites({
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
        top: 11.0,
        bottom: 11.0,
        left: 26.0,
        child: Container(
          width: 20.0,
          height: 18.0,
          child: Image.asset('res/icon/icon_heart_dark.png'),
        ),
      ),
      Positioned(
        top: 11.0,
        bottom: 11.0,
        right: 24.0,
        child: Text(
          AppTexts.toFavorites,
          style: AppTextStyles.textStyleDetailWhite,
        ),
      ),
    ]);
  }
}
