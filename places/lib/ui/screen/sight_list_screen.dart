import 'package:flutter/material.dart';

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
              style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.green,
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                    text: 'писок',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Colors.black,
                        fontSize: 32,
                        fontWeight: FontWeight.bold))
              ]),
          TextSpan(
              text: '\nи',
              style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.yellow,
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                    text: 'нтересных мест',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Colors.black,
                        fontSize: 32,
                        fontWeight: FontWeight.bold)),
              ])
        ])),
      ),
    );
  }
}
