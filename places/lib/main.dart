import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyFirstFulWidget()
        // MyHomePage(title: 'Flutter Demo Home Page'),
        );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
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
    return Container(
        child: Center(
      child: Text('Hello'),
    ));
  }
}
