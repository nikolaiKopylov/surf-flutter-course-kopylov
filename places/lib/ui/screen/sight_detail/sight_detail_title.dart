import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/constants.dart';
import 'package:places/ui/styles/text_styles.dart';

/// Title для текста на экране SightDetail
class SightDetailTitle extends StatelessWidget {
  final Sight sight;

  const SightDetailTitle({
    Key key,
    @required this.sight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      textDirection: TextDirection.ltr,
      children: [
        Container(
          width: double.infinity,
          child: Text(
            sight.name,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  right: 16,
                ),
                child: Text(
                  sight.type.title,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              Container(
                child: Text(
                  AppTexts.workTime,
                  style: Theme.of(context).textTheme.headline4,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
