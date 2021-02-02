import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';

import '../../constants.dart';

/// SightCardVisitedBody - sight card body (name, visitedtime, worktime)
class SightCardVisitedBody extends StatelessWidget {
  final Sight sight;

  const SightCardVisitedBody({Key key, this.sight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        right: 16,
        left: 16,
        bottom: 16,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16.0),
            bottomRight: Radius.circular(16.0)),
        color: Theme.of(context).backgroundColor,
      ),
      height: 122,
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
              style: Theme.of(context).textTheme.subtitle2,
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: 2.0,
              bottom: 2.0,
            ),
            height: 28.0,
            width: 296,
            alignment: Alignment.topLeft,
            child: Text(
              AppTexts.visitedTime,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              AppTexts.workTime,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ),
        ],
      ),
    );
  }
}
