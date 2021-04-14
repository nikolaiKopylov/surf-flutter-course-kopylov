import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/ui/constants.dart';
import 'package:places/ui/screen/add_sight_screen.dart';

class AddSightButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: 177.0,
        height: 48.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppIcons.iconPlus,
              color: Colors.white,
            ),
            SizedBox(width: 8),
            Text(AppTexts.newPlace.toUpperCase(),
                style: Theme.of(context).textTheme.button.copyWith(
                      fontStyle: FontStyle.normal,
                    )),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(
            24.0,
          )),
          gradient: LinearGradient(colors: [
            Theme.of(context).brightness == Brightness.dark
                ? AppColorsDark.yellowGradient
                : AppColorsLight.yellowGradient,
            Theme.of(context).brightness == Brightness.dark
                ? AppColorsDark.greenGradient
                : AppColorsLight.greenGradient,
          ]),
        ),
      ),
      onTap: () async {
        print('press button AddSight');

        await Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AddSightScreen(),
        ));
      },
    );
  }
}
