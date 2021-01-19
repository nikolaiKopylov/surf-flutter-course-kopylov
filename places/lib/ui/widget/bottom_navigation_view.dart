import 'package:flutter/material.dart';
import 'package:places/ui/constants.dart';

// Меню BottomNavigationView для навигации в приложении
class BottomNavigationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(AppIcons.iconList),
            title: Text('list'),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(AppIcons.iconHeartDark),
            title: Text('favorite'),
          ),
        ],
      ),
    );
  }
}
