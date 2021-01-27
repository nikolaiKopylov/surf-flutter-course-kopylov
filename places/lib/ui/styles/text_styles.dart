import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/ui/constants.dart';

/// TextStyle используемые в проекте
class AppTextStyles {
  static const TextStyle _textStyleRoboto = TextStyle(
    fontFamily: 'Roboto',
  );

  static TextStyle largeTitle = _textStyleRoboto.copyWith(
    fontWeight: FontWeight.bold,
    fontSize: 32,
  );

  static TextStyle title = _textStyleRoboto.copyWith(
    fontWeight: FontWeight.bold,
    fontSize: 24,
  );

  static TextStyle subTitle = _textStyleRoboto.copyWith(
    fontWeight: FontWeight.w500,
    fontSize: 18,
  );

  static TextStyle text = _textStyleRoboto.copyWith(
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );

  static TextStyle smallBold = _textStyleRoboto.copyWith(
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );

  static TextStyle small = _textStyleRoboto.copyWith(
    fontWeight: FontWeight.normal,
    fontSize: 14,
  );

  static TextStyle superSmall = _textStyleRoboto.copyWith(
    fontWeight: FontWeight.normal,
    fontSize: 12,
  );

  static TextStyle button = _textStyleRoboto.copyWith(
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );

  static TextStyle textStyleAppBarBlack = _textStyleRoboto.copyWith(
    color: AppColorsLight.main,
    fontSize: 32,
  );

  static TextStyle textStyleAppBarYellow = _textStyleRoboto.copyWith(
    color: Colors.yellow,
    fontSize: 32,
  );

  static TextStyle textStyleAppBarGreen = _textStyleRoboto.copyWith(
    color: AppColorsLight.green,
    fontSize: 32,
  );

  static TextStyle textStyleSightCardBottomUp = _textStyleRoboto.copyWith(
    color: AppColorsLight.main,
    fontSize: 16,
  );

  static TextStyle textStyleSightCardBottomDown = _textStyleRoboto.copyWith(
    color: AppColorsLight
        .background, // AppColors.greyBackground, почти не видно на экране
    fontSize: 14,
  );
  static TextStyle textStyleDetailTitle = _textStyleRoboto.copyWith(
    color: AppColorsLight.main,
    fontSize: 24,
  );

  static TextStyle textStyleDetailText = _textStyleRoboto.copyWith(
    color: AppColorsLight.main,
    fontSize: 14,
  );

  static TextStyle textStyleDetailGrey = _textStyleRoboto.copyWith(
    color: AppColorsLight.secondary2,
    fontSize: 14,
  );

  static TextStyle textStyleDetailWhite = _textStyleRoboto.copyWith(
    color: AppColorsLight.white,
    fontSize: 14,
  );

  static TextStyle textStyleWantVisitTime = _textStyleRoboto.copyWith(
    color: AppColorsLight.green,
    fontSize: 14,
  );
}
