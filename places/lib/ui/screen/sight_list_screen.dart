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
        title: Text(
          "Список \nинтересных мест",
          style: TextStyle(fontFamily: 'Roboto', color: Colors.black),
          textAlign: TextAlign.start,
          maxLines: 2,
        ),
      ),
    );
  }
}
