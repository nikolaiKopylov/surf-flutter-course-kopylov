import 'package:flutter/cupertino.dart';

class SearchRadius {
  final int startValue;
  final int endValue;

  SearchRadius({
    @required this.startValue,
    @required this.endValue,
  })  : assert(startValue != null),
        assert(endValue != null);
}
