import 'package:flutter/material.dart';
import 'package:places/ui/constants.dart';
import 'package:places/ui/styles/text_styles.dart';

/// lightTheme - светлая тема для приложения
final lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColorsLight.white,
  backgroundColor: AppColorsLight.background,
  secondaryHeaderColor: AppColorsLight.main,
  scaffoldBackgroundColor: AppColorsLight.white,
  dividerColor: AppColorsLight.secondary2,
  buttonColor: AppColorsLight.green,
  appBarTheme: AppBarTheme(
      color: AppColorsLight.background,
      textTheme: TextTheme(
        headline2: AppTextStyles.subTitle.copyWith(
          color: AppColorsLight.white,
        ),
      )),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: AppColorsLight.white,
    unselectedItemColor: AppColorsLight.white,
  ),
  tabBarTheme: TabBarTheme(
    unselectedLabelColor: AppColorsLight.secondary2,
    labelColor: AppColorsLight.white,
    labelStyle: AppTextStyles.smallBold,
    unselectedLabelStyle: AppTextStyles.smallBold,
    indicator: AppDecorations.tabBarBackground.copyWith(
      color: AppColorsLight.secondary,
    ),
  ),
  textTheme: TextTheme(
    headline1: AppTextStyles.largeTitle.copyWith(
      color: AppColorsLight.main,
    ),
    headline2: AppTextStyles.subTitle.copyWith(
      color: AppColorsLight.secondary,
    ),
    subtitle1: AppTextStyles.title.copyWith(
      color: AppColorsLight.secondary,
    ),
    subtitle2: AppTextStyles.text.copyWith(
      color: AppColorsLight.secondary,
    ),
    bodyText1: AppTextStyles.smallBold.copyWith(
      color: AppColorsLight.secondary,
    ),
    bodyText2: AppTextStyles.small.copyWith(
      color: AppColorsLight.secondary2,
    ),
    headline3: AppTextStyles.small.copyWith(
      color: AppColorsLight.green,
    ),
    headline4: AppTextStyles.small.copyWith(
      color: AppColorsLight.secondary2,
    ),
    headline5: AppTextStyles.small.copyWith(
      color: AppColorsLight.inactiveBlack,
    ),
    overline: AppTextStyles.superSmall.copyWith(
      color: AppColorsLight.secondary,
    ),
    button: AppTextStyles.button.copyWith(
      color: AppColorsLight.white,
    ),
  ),
);

// darkTheme - темная тема для приложения
final darkTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColorsDark.main,
  backgroundColor: AppColorsDark.background,
  secondaryHeaderColor: AppColorsDark.white,
  scaffoldBackgroundColor: AppColorsDark.main,
  dividerColor: AppColorsDark.secondary2,
  buttonColor: AppColorsDark.green,
  appBarTheme: AppBarTheme(
      color: AppColorsDark.main,
      textTheme: TextTheme(
        headline2: AppTextStyles.subTitle.copyWith(
          color: AppColorsDark.white,
        ),
      )),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: AppColorsDark.main,
    unselectedItemColor: AppColorsDark.white,
  ),
  tabBarTheme: TabBarTheme(
    unselectedLabelColor: AppColorsDark.secondary2,
    labelColor: AppColorsDark.secondary,
    labelStyle: AppTextStyles.smallBold,
    unselectedLabelStyle: AppTextStyles.smallBold,
    indicator: AppDecorations.tabBarBackground.copyWith(
      color: AppColorsDark.white,
    ),
  ),
  textTheme: TextTheme(
    headline1: AppTextStyles.largeTitle.copyWith(
      color: AppColorsDark.white,
    ),
    headline2: AppTextStyles.subTitle.copyWith(
      color: AppColorsDark.white,
    ),
    subtitle1: AppTextStyles.title.copyWith(
      color: AppColorsDark.white,
    ),
    subtitle2: AppTextStyles.text.copyWith(
      color: AppColorsDark.white,
    ),
    bodyText1: AppTextStyles.smallBold.copyWith(
      color: AppColorsDark.white,
    ),
    bodyText2: AppTextStyles.small.copyWith(
      color: AppColorsDark.secondary2,
    ),
    headline3: AppTextStyles.small.copyWith(
      color: AppColorsDark.green,
    ),
    headline4: AppTextStyles.small.copyWith(
      color: AppColorsDark.inactiveBlack,
    ),
    headline5: AppTextStyles.small.copyWith(
      color: AppColorsDark.white,
    ),
    overline: AppTextStyles.superSmall.copyWith(
      color: AppColorsDark.white,
    ),
    button: AppTextStyles.button.copyWith(
      color: AppColorsDark.white,
    ),
  ),
);
