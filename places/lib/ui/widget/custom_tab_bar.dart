import 'package:flutter/material.dart';
import 'package:places/ui/styles/text_styles.dart';

import '../constants.dart';

///  CustomTabBa отображает TabBar через наследника PreferredSizeWidget
/// для использования  Padding в соответствии с дизайном
class CustomTabBar extends PreferredSize {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: preferredSize.height,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 6.0,
        ),
        child: Container(
          decoration: AppDecorations.tabBarBackground.copyWith(
            color: Theme.of(context).backgroundColor,
          ),
          child: TabBar(
            // unselectedLabelColor: AppColorsLight.secondary2,
            // labelColor: AppColorsLight.white,
            // indicator: AppDecorations.tabBarBackground.copyWith(
            //   color: AppColorsLight.main,
            // ),
            tabs: [
              Tab(
                child: Text(
                  AppTexts.wantVisit,
                ),
              ),
              Tab(
                child: Text(
                  AppTexts.visited,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(52);
}
