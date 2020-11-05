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
              color: Colors.brown,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    onPressed: _incrementar,
                    backgroundColor: Colors.amberAccent,
                    child: Icon(
                      Icons.add,
                      size: 35,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 25, right: 25, top: 25, bottom: 25),
                    child: Text(
                      "$_counter",
                      style: TextStyle(
                        fontSize: 40,
                      ),
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: _reducir,
                    backgroundColor: Colors.amberAccent,
                    child: Icon(
                      Icons.remove,
                      size: 35,
                      color: Colors.black,
                    ),
                  ),
                ],
              )),
          Container(
            color: Colors.blueGrey,
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
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10)),
                        )
                      : i % 5 == 0
                          ? Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(8),
                              child: Text('Buck'),
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(5)),
                            )
                          : i % 3 == 0
                              ? Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(8),
                                  child: Text('Face'),
                                  decoration: BoxDecoration(
                                      color: Colors.purple,
                                      borderRadius: BorderRadius.circular(5)),
                                )
                              : Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(8),
                                  child: Text('$i'),
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(5)),
                                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
