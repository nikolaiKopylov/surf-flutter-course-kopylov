import 'dart:math';

import 'package:places/domain/category.dart';
import 'package:places/domain/point.dart';
import 'package:places/domain/search_radius.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';

class Filter {
  List<Category> category;
  SearchRadius searchRadius;
  Filter({
    this.category,
    this.searchRadius,
  });
}

List<Sight> filteredSightList(
    List<Sight> sight, Point geoPoint, Filter filter) {
  final filteredSight = sight
      .where((element) =>
          filter.category.contains(element.type) || filter.category.isEmpty)
      .where((element) => arePointsNear(
            checkPoint: geoPoint,
            centerPoint: Point(lat: element.lat, lon: element.lon),
            minDistance: filter.searchRadius.startValue,
            maxDistance: filter.searchRadius.endValue,
          ));
  return filteredSight.toList();
}
