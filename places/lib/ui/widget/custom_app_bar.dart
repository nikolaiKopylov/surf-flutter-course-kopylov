import 'package:flutter/material.dart';
import 'package:places/ui/styles/text_styles.dart';

import '../constants.dart';

/// Widget для отображения AppBar через наследника PreferredSizeWidget
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: preferredSize.height,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 64,
        ),
        child: Text(
          AppTexts.appHeader,
          style: AppTextStyles.textStyleAppBarBlack,
          textAlign: TextAlign.start,
          maxLines: 2,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(136); // 72 + 64
}
