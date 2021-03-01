// FilterScreenButton - кнопка показать выбранные категории
import 'package:flutter/material.dart';
import 'package:sprintf/sprintf.dart';

import '../../constants.dart';

class FilterScreenButton extends StatelessWidget {
  final int count;

  const FilterScreenButton({
    Key key,
    this.count,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: FlatButton(
        height: 48,
        minWidth: double.infinity,
        color: Theme.of(context).buttonColor,
        disabledColor: Theme.of(context).disabledColor,
        disabledTextColor: Theme.of(context).brightness == Brightness.dark
            ? AppColorsDark.inactiveBlack
            : AppColorsLight.inactiveBlack,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        onPressed: count != 0
            ? () {
                print('press FilterScreenButton count = $count ');
              }
            : null,
        child: Text(
            sprintf(AppTexts.filterButton, [
              count.toString(),
            ]),
            style: Theme.of(context).textTheme.caption),
      ),
    );
  }
}
