import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/ui/constants.dart';

/// TextStyle используемые в проекте

class AppTextStyles {
  static const TextStyle _textStyleRoboto = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.bold,
  );

  static TextStyle textStyleAppBarBlack = _textStyleRoboto.copyWith(
    color: AppColors.black,
    fontSize: 32,
  );

  static TextStyle textStyleAppBarYellow = _textStyleRoboto.copyWith(
    color: Colors.yellow,
    fontSize: 32,
  );

  static TextStyle textStyleAppBarGreen = _textStyleRoboto.copyWith(
    color: AppColors.green,
    fontSize: 32,
  );

  static TextStyle textStyleSightCardBottomUp = _textStyleRoboto.copyWith(
    color: AppColors.black,
    fontSize: 16,
  );

  static TextStyle textStyleSightCardBottomDown = _textStyleRoboto.copyWith(
    color:
        AppColors.grey2, // AppColors.greyBackground, почти не видно на экране
    fontSize: 14,
  );
  static TextStyle textStyleDetailTitle = _textStyleRoboto.copyWith(
    color: AppColors.black,
    fontSize: 24,
  );

  static TextStyle textStyleDetailText = _textStyleRoboto.copyWith(
    color: AppColors.black,
    fontSize: 14,
  );

  static TextStyle textStyleDetailGrey = _textStyleRoboto.copyWith(
    color: AppColors.grey2,
    fontSize: 14,
  );
}
