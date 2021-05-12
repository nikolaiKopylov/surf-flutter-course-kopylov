import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/screen/util/utils.dart';
import 'package:places/ui/styles/text_styles.dart';
import 'sight_card_want_visit_widget.dart';

import '../../constants.dart';

/// SightCardWantVisitHeader - sight card want visit header (image, type, buttons)
class SightCardWantVisitHeader extends StatelessWidget {
  final Sight sight;

  const SightCardWantVisitHeader({
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
            style: AppTextStyles.textStyleDetailWhite,
          ),
        ),
        Positioned(
          right: 8,
          top: 8,
          child: SightCardWantVisitCloseButton(),
        ),
        Positioned(
          right: 48,
          top: 8,
          child: SightCardWantVisitCalendarButton(),
        ),
      ],
    );
  }
}
