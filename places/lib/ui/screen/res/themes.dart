import 'package:flutter/material.dart';
import 'package:places/ui/constants.dart';
import 'package:places/ui/styles/text_styles.dart';

/// lightTheme - светлая тема для приложения
final lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColorsLight.main,
  backgroundColor: AppColorsLight.background,
  secondaryHeaderColor: AppColorsLight.main,
  scaffoldBackgroundColor: AppColorsLight.white,
  dividerColor: AppColorsLight.secondary2,
  buttonColor: AppColorsLight.green,
  disabledColor: AppColorsLight.background,
  iconTheme: IconThemeData(color: AppColorsLight.secondary),
  appBarTheme: AppBarTheme(
      color: AppColorsLight.white,
      textTheme: TextTheme(
        headline2: AppTextStyles.subTitle.copyWith(
          color: AppColorsLight.white,
        ),
      )),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: AppColorsLight.white,
    unselectedItemColor: AppColorsLight.secondary,
    selectedItemColor: AppColorsLight.secondary,
    unselectedIconTheme: IconThemeData(
      color: AppColorsLight.secondary,
    ),
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
  sliderTheme: SliderThemeData(
    activeTrackColor: AppColorsLight.green,
    inactiveTrackColor: AppColorsLight.inactiveBlack,
    thumbColor: AppColorsLight.white,
    overlayColor: AppColorsLight.inactiveBlack,
  ),
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
    primary: AppColorsLight.green,
  )),
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
        color: AppColorsLight.secondary,
      ),
      overline: AppTextStyles.superSmall.copyWith(
        color: AppColorsLight.secondary,
      ),
      button: AppTextStyles.button.copyWith(
        color: AppColorsLight.white,
      ),
      caption: AppTextStyles.smallBold.copyWith(
        color: AppColorsLight.white,
      ),
      headline6: AppTextStyles.filtersTitle.copyWith(
        color: AppColorsLight.main,
      )),
);

// darkTheme - темная тема для приложения
final darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: AppColorsDark.white,
  backgroundColor: AppColorsDark.background,
  secondaryHeaderColor: AppColorsDark.white,
  scaffoldBackgroundColor: AppColorsDark.main,
  dividerColor: AppColorsDark.secondary2,
  buttonColor: AppColorsDark.green,
  disabledColor: AppColorsDark.dark,
  iconTheme: IconThemeData(color: AppColorsDark.white),
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
    unselectedIconTheme: IconThemeData(
      color: AppColorsLight.white,
    ),
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
  sliderTheme: SliderThemeData(
    activeTrackColor: AppColorsDark.green,
    inactiveTrackColor: AppColorsDark.inactiveBlack,
    thumbColor: AppColorsDark.white,
    overlayColor: AppColorsDark.inactiveBlack,
  ),
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
    primary: AppColorsDark.green,
  )),
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
    caption: AppTextStyles.smallBold.copyWith(
      color: AppColorsDark.white,
    ),
    headline6: AppTextStyles.filtersTitle.copyWith(
      color: AppColorsDark.white,
    ),
  ),
);
