import 'package:flutter/material.dart';

/// Содержит константы цветов используемые в проекте ,
///  кроме цветов временных заглушек
class AppColors {
  static const black = Color(0xFF3B3E5B);
  static const green = Color(0xFF4CAF50);
  static const greyBackground = Color(0xFFF5F5F5);
  static const grey = Color(0x7C7E92); // Очень плохо виден на экране
  static const grey2 = Colors.grey;
  static const greyDriver = Color(0x8F7C7E92);
  static const white = Color(0xFFFFFFFF);
  static const blackButton = Color(0x3B3E5B);
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
}

class AppIcons {
  static const iconShare = 'res/icon/icon_share.png';
  static const iconClose = 'res/icon/icon_close.png';
  static const iconCalendarWhite = 'res/icon/icon_calendar_white.png';
  static const iconCalendar = 'res/icon/icon_calendar.png';
  static const iconGo = 'res/icon/icon_go.png';
  static const iconHeart = 'res/icon/icon_heart.png';
  static const iconHeartDark = 'res/icon/icon_heart_dark.png';
  static const iconMap = 'res/icon/icon_map.png';
  static const iconList = 'res/icon/icon_list.png';
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
