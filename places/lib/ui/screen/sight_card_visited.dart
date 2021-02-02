import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/constants.dart';
import 'sight_card_visited/sight_card_visited_widget.dart';

///SightCardVisited - Экран карточки посещенного места
class SightCardVisited extends StatelessWidget {
  final Sight sight;

  const SightCardVisited({
    Key key,
    @required this.sight,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3.0 / 2.0,
      child: Padding(
        padding: EdgeInsets.only(
          left: 16,
          top: 16,
          right: 16,
        ),
        child: Column(
          children: [
            SightCardVisitedHeader(
              sight: sight,
            ),
            SightCardVisitedBody(
              sight: sight,
            ),
          ],
        ),
      ),
    );
  }
}
