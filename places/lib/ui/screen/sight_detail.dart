import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/styles/text_styles.dart';

class SightDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 360,
            width: double.infinity,
            color: Colors.blueGrey,
          ),
          Container(
            padding: EdgeInsets.only(
              top: 24,
              right: 16,
              left: 16,
              bottom: 24,
            ),
            child: Column(
              textDirection: TextDirection.ltr,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    mocks[0].name,
                    style: AppTextStyles.textStyleDetailTitle,
                  ),
                ),
                Container(
                  child: Row(
                    textDirection: TextDirection.ltr,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                          right: 16,
                        ),
                        child: Text(
                          mocks[0].type,
                          style: AppTextStyles.textStyleSightCardBottomUp,
                          textDirection: TextDirection.ltr,
                        ),
                      ),
                      Container(
                        child: Text(
                          'закрыто до 9:00',
                          style: AppTextStyles.textStyleSightCardBottomDown,
                          textDirection: TextDirection.ltr,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: 16,
                    bottom: 16,
                  ),
                  child: Text(
                    mocks[0].details,
                    style: AppTextStyles.textStyleDetailText,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: 24,
                    bottom: 24,
                  ),
                  width: 328,
                  height: 48,
                  color: Colors.green,
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
            ),
            child: Divider(
              color: Color(0x8F7C7E92),
              height: 0,
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: 12,
            ),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 164,
                  height: 40,
                  color: Colors.blueAccent,
                ),
                Container(
                  width: 164,
                  height: 40,
                  color: Colors.blueAccent,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
