import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/constants.dart';
import 'package:places/ui/styles/text_styles.dart';
import 'package:places/ui/widget/image_network.dart';

import 'util/utils.dart';

/// SightCardWantVisit - Экран карточки места, посещение которого запланнировано
class SightCardWantVisit extends StatelessWidget {
  final Sight sight;

  const SightCardWantVisit({
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
            Stack(
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
                    child: Image.asset(AppIcons.iconCalendarWhite),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(
                right: 16,
                left: 16,
                bottom: 16,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16.0),
                    bottomRight: Radius.circular(16.0)),
                color: AppColors.greyBackground,
              ),
              height: 102,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: 160,
                      maxHeight: 62,
                    ),
                    child: Text(
                      sight.name,
                      style: AppTextStyles.textStyleSightCardBottomUp,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    height: 28.0,
                    width: 296.0,
                    padding: EdgeInsets.only(
                      top: 2.0,
                      bottom: 2.0,
                    ),
                    child: Text(
                      AppTexts.wantVisitTime,
                      style: AppTextStyles.textStyleWantVisitTime,
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    height: 18.0,
                    width: 296.0,
                    child: Text(
                      AppTexts.workTime,
                      style: AppTextStyles.textStyleSightCardBottomDown,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
