import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/ui/constants.dart';
import 'package:places/ui/widget/bottom_navigation_view.dart';
import 'package:places/ui/widget/theme_controller.dart';
import 'package:provider/provider.dart';

/// SettingsScreen - экран настроек приложения
class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 56,
        elevation: 0,
        title: Text(
          AppTexts.settings,
          style: Theme.of(context).textTheme.headline2,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: Column(
          children: [
            Container(
              height: 56.0,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppTexts.darkTheme,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  CupertinoSwitch(
                    trackColor: Theme.of(context).brightness == Brightness.light
                        ? AppColorsLight.inactiveBlack
                        : AppColorsDark.green,
                    value:
                        context.watch<ThemeController>().getThemeController(),
                    onChanged: (newValue) {
                      final controller = context.read<ThemeController>();
                      if (newValue) {
                        controller.toDark();
                      } else
                        controller.toLight();
                    },
                  )
                ],
              ),
            ),
            Divider(
              height: 0.0,
            ),
            Container(
              height: 56.0,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppTexts.tutorial,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  IconButton(
                    iconSize: 24.0,
                    color: Theme.of(context).buttonColor,
                    icon: SvgPicture.asset(
                      AppIcons.iconUnion,
                    ),
                    onPressed: () {
                      print('press iconUnion');
                    },
                    visualDensity: VisualDensity.compact,
                  )
                ],
              ),
            ),
            Divider(
              height: 0.0,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationView(),
    );
  }
}
