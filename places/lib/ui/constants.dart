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
}

/// Содержит константы текста используемые в проекте

class AppTexts {
  static const appHeader = "Список \nинтересных мест";
  static const sightCardText = 'Воронежский областной краеведческий музей';
  static const sightCardType = 'музей';
  static const createRoute = 'ПОСТРОИТЬ МАРШРУТ';
  static const addPlan = 'Запланировать';
  static const toFavorites = 'В Избранное';
  static const shortDescription = 'краткое описаниe ';
  static const workTime = 'закрыто до 9:00';
}
