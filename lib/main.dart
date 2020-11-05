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
  List<Container> containers = new List();

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
      body: Center(
        child: Column(children: [
          Container(
              child: Row(
            children: [
              FloatingActionButton(
                onPressed: _incrementar,
                child: Icon(
                  Icons.add,
                  size: 35,
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Text(
                  "$_counter",
                  style: TextStyle(
                    fontSize: 40,
                  ),
                ),
              ),
              FloatingActionButton(
                onPressed: _reducir,
                child: Icon(
                  Icons.remove,
                  size: 35,
                  color: Colors.black,
                ),
              ),
            ],
          )),
          Container(
            height: 400,
            child: GridView.count(
              padding: EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 4,
              children: [
                for (var i = 1; i < _counter + 1; i++)
                  i % 3 == 0 && i % 5 == 0
                      ? Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(8),
                          child: Text('FB'),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [Colors.blue, Colors.green],
                            ),
                          ),
                        )
                      : i % 5 == 0
                          ? Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(8),
                              child: Text('Buck'),
                              color: Colors.green,
                            )
                          : i % 3 == 0
                              ? Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(8),
                                  child: Text('Face'),
                                  color: Colors.blue,
                                )
                              : Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(8),
                                  child: Text('$i'),
                                  color: Colors.white,
                                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
