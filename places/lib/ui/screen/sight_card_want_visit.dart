import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/constants.dart';

import 'sight_card_want_visit/sight_card_want_visit_widget.dart';

/// SightCardWantVisit - Экран карточки места, посещение которого запланнировано
class SightCardWantVisit extends StatelessWidget {
  final Sight sight;
  final Function deleteWantVisitCard;

  const SightCardWantVisit({
    Key key,
    @required this.sight,
    @required this.deleteWantVisitCard,
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
            SightCardWantVisitHeader(
              sight: sight,
              deleteWantVisitCard: deleteWantVisitCard,
            ),
            SightCardWantVisitBody(
              sight: sight,
            ),
          ],
        ),
      ),
    );
  }
}
