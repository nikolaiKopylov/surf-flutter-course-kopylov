import 'dart:math';

import 'package:flutter/material.dart';

// Point - класс для обозначения точки на карте
class Point {
  final double lat;
  final double lon;

  Point(
    @required this.lat,
    @required this.lon,
  )   : assert(lat != null),
        assert(lon != null);
}

///arePointsNear - функция для определения, нахождения точки  радиусе
/// distance - переается в метрах , так как слайдер выдает от 100 до 10000 метров
bool arePointsNear(
    {Point checkPoint,
    Point centerPoint,
    double minDistance,
    double maxDistance}) {
  var ky = 40000000 / 360;
  var kx = cos(pi * centerPoint.lat / 180.0) * ky;
  var dx = (centerPoint.lon - checkPoint.lon).abs() * kx;
  var dy = (centerPoint.lat - checkPoint.lat).abs() * ky;
  var dis = sqrt(dx * dx + dy * dy);
  return dis <= maxDistance && dis >= minDistance;
}
