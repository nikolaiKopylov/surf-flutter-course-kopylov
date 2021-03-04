import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:places/domain/sight.dart';
import 'sight_card/sight_card_widget.dart';

/// Экран карточки интересного места
class SightCard extends StatelessWidget {
  final Sight sight;

  const SightCard({
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
        child: Stack(children: [
          Column(
            children: [
              SightCardHeader(
                sight: sight,
              ),
              SightCardBody(
                sight: sight,
              )
            ],
          ),
          Positioned.fill(
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                  borderRadius: BorderRadius.circular(16.0),
                  onTap: () {
                    print('OnTap SightCard');
                  }),
            ),
          ),
          Positioned(
            right: 8,
            top: 8,
            child: SightCardFavoriteButton(),
          ),
        ]),
      ),
    );
  }
}
