import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/ui/constants.dart';
import 'package:places/ui/widget/bottom_navigation_view.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isDarkTheme = false;

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
                  Switch(
                    value: isDarkTheme,
                    onChanged: (newValue) {
                      setState(() {
                        isDarkTheme = newValue;
                        print(isDarkTheme);
                      });
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
