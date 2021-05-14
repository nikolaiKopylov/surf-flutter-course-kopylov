import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants.dart';

/// [CenterMessage] сообщение при ошибке поиска
class CenterMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color color = AppColorsDark.inactiveBlack;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(53.2),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                AppIcons.iconSearch,
                height: 50,
                width: 50,
                color: color,
              ),
              SizedBox(
                height: 32.0,
              ),
              Text(
                AppTexts.notSearch,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline2
                    .copyWith(color: color),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                AppTexts.editSearchParams,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    .copyWith(color: color),
              )
            ],
          ),
        ),
      ),
    );
  }
}
