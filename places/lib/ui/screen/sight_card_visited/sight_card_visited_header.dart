import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/screen/util/utils.dart';
import 'package:places/ui/styles/text_styles.dart';

import '../../constants.dart';

/// SightCardVisitedHeader - sight card visited header (image, type,  buttons)
class SightCardVisitedHeader extends StatelessWidget {
  final Sight sight;

  const SightCardVisitedHeader({
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
            sight.type,
            style: AppTextStyles.textStyleDetailWhite,
          ),
        ),
        Positioned(
          right: 16,
          top: 16,
          child: Container(
            width: 20,
            height: 18,
            child: Image.asset(AppIcons.iconClose),
          ),
        ),
        Positioned(
          right: 56,
          top: 16,
          child: Container(
            width: 20,
            height: 18,
            child: Image.asset(AppIcons.iconShare),
          ),
        ),
      ],
    );
  }
}
