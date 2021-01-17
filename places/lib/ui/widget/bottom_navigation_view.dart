import 'package:flutter/material.dart';

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
            icon: Image.asset('res/icon/icon_list.png'),
            title: Text('list'),
          ),
          BottomNavigationBarItem(
            icon: Image.asset('res/icon/icon_heart_dark.png'),
            title: Text('favorite'),
          ),
        ],
      ),
    );
  }
}
