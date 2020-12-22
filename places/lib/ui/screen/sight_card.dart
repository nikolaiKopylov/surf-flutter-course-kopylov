import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/constants.dart';
import 'package:places/ui/styles/text_styles.dart';

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
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  color: Colors.amber,
                  width: double.infinity,
                  height: 96,
                ),
                Positioned(
                  left: 16,
                  top: 16,
                  child: Text(sight.type),
                ),
                Positioned(
                  right: 16,
                  top: 16,
                  child: Container(
                    color: Colors.red,
                    width: 20,
                    height: 18,
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(
                right: 16,
                left: 16,
              ),
              height: 92,
              width: double.infinity,
              color: AppColors.greyBackground,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 151, maxHeight: 62),
                    child: Text(
                      sight.name,
                      style: AppTextStyles.textStyleSightCardBottomUp,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
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
