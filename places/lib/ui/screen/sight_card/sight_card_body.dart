import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';

import '../../constants.dart';

/// SightCardBody - sight card body (name, worktime)
class SightCardBody extends StatelessWidget {
  final Sight sight;

  const SightCardBody({Key key, this.sight}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16.0),
            bottomRight: Radius.circular(16.0)),
        color: Theme.of(context).backgroundColor,
      ),
      padding: EdgeInsets.only(
        right: 16,
        left: 16,
        bottom: 16,
      ),
      height: 92,
      width: double.infinity,
      //  color: AppColors.grey2, //Background,
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
              style: Theme.of(context).textTheme.subtitle2,
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              AppTexts.workTime,
              style: Theme.of(context).textTheme.bodyText2,
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}
