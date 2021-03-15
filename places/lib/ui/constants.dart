import 'package:flutter/material.dart';

/// Содержит константы цветов используемые в проекте ,
///  кроме цветов временных заглушек
/// для светлой темы
class AppColorsLight {
  static const background = Color(0xFFF5F5F5);
  static const green = Color(0xFF4CAF50);
  static const yellow = Color(0xFFFBC02D);
  static const red = Color(0xFFEF4343);
  static const main = Color(0xFF252849);
  static const secondary = Color(0xFF3B3E5B);
  static const secondary2 = Color(0xFF7C7E92);
  static const inactiveBlack = Color(0x8F7C7E92);
  static const white = Color(0xFFFFFFFF);
}

/// Содержит константы цветов используемые в проекте ,
///  кроме цветов временных заглушек
/// для темной темы
class AppColorsDark {
  static const background = dark;
  static const green = Color(0xFF71D675);
  static const yellow = Color(0xFFFFEA7E);
  static const red = Color(0xFFCF2A2A);
  static const dark = Color(0xFF1A1A20);
  static const main = Color(0xFF21222C);
  static const secondary = Color(0xFF3B3E5B);
  static const secondary2 = Color(0xFF7C7E92);
  static const inactiveBlack = Color(0x8F7C7E92);
  static const white = Color(0xFFFFFFFF);
}

/// Содержит константы текста используемые в проекте
class AppTexts {
  static const appHeader = "Список \nинтересных мест";
  static const createRoute = 'ПОСТРОИТЬ МАРШРУТ';
  static const addPlan = 'Запланировать';
  static const toFavorites = 'В Избранное';
  static const shortDescription = 'краткое описаниe ';
  static const workTime = 'закрыто до 9:00';
  static const visited = 'Посетил';
  static const wantVisit = 'Хочу посетить';
  static const favorites = 'Избранное';
  static const wantVisitTime = 'Запланировано на 12 окт. 2020';
  static const visitedTime = 'Цель достигнута 12 окт. 2020';
  static const sliderTitle = 'Расстояние';
  static const sliderRadius = 'от %s до %s';
  static const categories = 'категории';
  static const clear = 'Очистить';
  static const filterButton = 'ПОКАЗАТЬ(%s)';
  static const settings = 'Настройки';
  static const darkTheme = 'Тёмная тема';
  static const tutorial = 'Смотреть туториал';
}

class AppIcons {
  static const iconShare = 'res/icon/icon_share.svg';
  static const iconClose = 'res/icon/icon_close.svg';
  static const iconCalendar = 'res/icon/icon_calendar.svg';
  static const iconGo = 'res/icon/icon_go.svg';
  static const iconHeart = 'res/icon/icon_heart.svg';
  static const iconMap = 'res/icon/icon_map.svg';
  static const iconList = 'res/icon/icon_list.svg';
  static const iconCafe = 'res/icon/icon_cafe.svg';
  static const iconHotel = 'res/icon/icon_hotel.svg';
  static const iconMuseum = 'res/icon/icon_museum.svg';
  static const iconPark = 'res/icon/icon_park.svg';
  static const iconParticularPlace = 'res/icon/icon_particular_place.svg';
  static const iconRestourant = 'res/icon/icon_restourant.svg';
  static const iconTickChoice = 'res/icon/icon_tick_choice.svg';
  static const iconSettingsFill = 'res/icon/icon_settings_fill.svg';
  static const iconUnion = 'res/icon/icon_union.svg';
}

class AppDecorations {
  static const tabBarBackground = BoxDecoration(
    borderRadius: BorderRadius.all(
      Radius.circular(
        40.0,
      ),
    ),
  );
}
