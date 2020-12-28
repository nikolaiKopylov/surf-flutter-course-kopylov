import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/widget/image_network.dart';

/// Header sceen SightDetail
/// заглушка экрана для будующей галереи
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
      child: ImageNetwork(imageUrl: sight.url),
    );
  }
}
