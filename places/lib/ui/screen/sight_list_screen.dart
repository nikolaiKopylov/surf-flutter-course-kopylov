import 'package:flutter/material.dart';
import 'package:places/ui/styles/text_styles.dart';

class SightListScreen extends StatefulWidget {
  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        toolbarHeight: 72.0,
        title: RichText(
            text: TextSpan(children: [
          TextSpan(
              text: 'С',
              style: AppTextStyles.textStyleAppBarGreen,
              children: [
                TextSpan(
                  text: 'писок',
                  style: AppTextStyles.textStyleAppBarBlack,
                )
              ]),
          TextSpan(
              text: '\nи',
              style: AppTextStyles.textStyleAppBarYellow,
              children: [
                TextSpan(
                  text: 'нтересных мест',
                  style: AppTextStyles.textStyleAppBarBlack,
                ),
              ])
        ])),
      ),
    );
  }
}
