import 'package:flutter/material.dart';
import 'ui/screen/sight_list_screen.dart';
import 'ui/screen/sight_card.dart';
import 'ui/screen/sight_detail.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SightDetail(), //SightListScreen(),
      title: 'FirstApp',
    );
  }
}

class MyFirstWidget extends StatelessWidget {
  int _callBuild = 0;
  @override
  Widget build(BuildContext context) {
    _callBuild++;
    print('Build StatelessWidget call - $_callBuild');
    return Container(
      child: Center(
        child: Text('Hello'),
      ),
    );
  }
  // не сработало так как, context не является переменой сласса и находится вне зоны видимости
  //Type getContextRuntime() => context.runtimeType;
}

class MyFirstFulWidget extends StatefulWidget {
  @override
  _MyFirstFulWidgetState createState() => _MyFirstFulWidgetState();
}

class _MyFirstFulWidgetState extends State<MyFirstFulWidget> {
  int _callBuild = 0;
  @override
  Widget build(BuildContext context) {
    _callBuild++;
    print('Build StatefulWidget call - $_callBuild');

    print(getContextRuntime());
    return Container(
        child: Center(
      child: Text('Hello'),
    ));
  }

  // вернуло StatefulElement
  Type getContextRuntime() => context.runtimeType;
}
