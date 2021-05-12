import 'package:flutter/material.dart';
import 'package:places/ui/screen/sight_list_screen.dart';
import 'package:places/ui/styles/text_styles.dart';
import 'package:places/ui/widget/search_bar.dart';

import '../constants.dart';

/// Widget для отображения AppBar через наследника PreferredSizeWidget
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget bottom;
  final bool isBackVisible;

  const CustomAppBar({
    Key key,
    this.bottom,
    this.isBackVisible = false,
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
              child: Row(
                // textDirection: TextDirection.rtl,
                children: [
                  isBackVisible
                      ? IconButton(
                          color: Theme.of(context).primaryColor,
                          icon: Icon(
                            Icons.arrow_back_ios_rounded,
                            size: 24,
                          ),
                          onPressed: () async {
                            await Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SightListScreen(),
                            ));
                          },
                        )
                      : Container(),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 25),
                      child: Text(
                        AppTexts.appHeader,
                        style: Theme.of(context).textTheme.headline2,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                      ),
                    ),
                  ),
                ],
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
