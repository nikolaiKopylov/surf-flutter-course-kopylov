import 'package:flutter/material.dart';
import 'package:places/ui/styles/text_styles.dart';
import 'package:places/ui/widget/search_bar.dart';

import '../constants.dart';

/// Widget для отображения AppBar через наследника PreferredSizeWidget
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget bottom;

  const CustomAppBar({
    Key key,
    @required this.bottom,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: preferredSize.height,
      child: Column(
        children: [
          SizedBox(
            height: 24,
          ),
          Expanded(
            child: Center(
              child: Text(
                AppTexts.appHeader,
                style: Theme.of(context).textTheme.headline2,
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
            ),
          ),
          bottom,
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(135); // 72 + 64
}
