import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/screen/sight_card/sight_card_widget.dart';
import 'package:places/ui/screen/util/utils.dart';

/// SightCardHeader - sight card header (image, type, favorite button)
class SightCardHeader extends StatelessWidget {
  final Sight sight;

  const SightCardHeader({
    Key key,
    this.sight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 96,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0)),
            image: DecorationImage(
              image: Image.network(
                sight.url,
                loadingBuilder: buildImageProgressIndicator,
              ).image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          left: 16,
          top: 16,
          child: Text(
            sight.type.title,
            style: Theme.of(context).textTheme.caption,
          ),
        ),
      ],
    );
  }
}
