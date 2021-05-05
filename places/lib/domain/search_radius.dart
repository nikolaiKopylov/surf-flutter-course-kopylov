import 'package:flutter/cupertino.dart';

class SearchRadius {
  final double startValue;
  final double endValue;

  SearchRadius({
    @required this.startValue,
    @required this.endValue,
  })  : assert(startValue != null),
        assert(endValue != null);
}
