import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/ui/constants.dart';

// Меню BottomNavigationView для навигации в приложении
class BottomNavigationView extends StatelessWidget {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedIconTheme:
            Theme.of(context).bottomNavigationBarTheme.unselectedIconTheme,
        type: BottomNavigationBarType.fixed,
        onTap: (_currentIndex) {
          print('press BottomNavigationBarItem index = $_currentIndex');
        },
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppIcons.iconList,
              color: Theme.of(context)
                  .bottomNavigationBarTheme
                  .unselectedIconTheme
                  .color,
            ),
            title: Text('list'),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppIcons.iconHeart,
              color: Theme.of(context)
                  .bottomNavigationBarTheme
                  .unselectedIconTheme
                  .color,
            ),
            title: Text('favorite'),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppIcons.iconSettingsFill,
              color: Theme.of(context)
                  .bottomNavigationBarTheme
                  .unselectedIconTheme
                  .color,
            ),
            title: Text('settings'),
          )
        ],
      ),
    );
  }
}
