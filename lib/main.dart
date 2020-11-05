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
      home: MyHomePage(title: 'Examen'),
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

  void _incrementar() {
    setState(() {
      _counter++;
    });
  }

  void _reducir() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(children: [
        Row(
          children: [
            IconButton(
                onPressed: () => _incrementar(),
                icon: Icon(Icons.add),
                color: Colors.green),
            Text(
              '${_counter}',
              style: Theme.of(context).textTheme.headline3,
            ),
            IconButton(
                onPressed: () => _reducir(),
                icon: Icon(Icons.remove),
                color: Colors.red),
          ],
        )
      ]),
    );
  }
}