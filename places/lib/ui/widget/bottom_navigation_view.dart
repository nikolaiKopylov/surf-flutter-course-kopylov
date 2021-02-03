import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/ui/constants.dart';

// Меню BottomNavigationView для навигации в приложении
class BottomNavigationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedIconTheme:
            Theme.of(context).bottomNavigationBarTheme.unselectedIconTheme,
        type: BottomNavigationBarType.fixed,
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
        ],
      ),
    );
  }
}
