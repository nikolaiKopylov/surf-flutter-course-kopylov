import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/screen/util/utils.dart';

/// Header экрана SightDetail
/// заглушка экрана для будущей галереи

class SightDetailHeader extends StatelessWidget {
  final Sight sight;

  const SightDetailHeader({
    Key key,
    @required this.sight,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 360,
      width: double.infinity,
      color: Colors.blueGrey,
      child: Image.network(
        sight.url,
        fit: BoxFit.cover,
        loadingBuilder: buildImageProgressIndicator,
      ),
    );
  }
}
