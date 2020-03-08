import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  final list = <String>[];
  final controller = TextEditingController();
  final buttonTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 18,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 10, 20, 5),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(child: TextField(controller: controller)),
                SizedBox(width: 15),
                RaisedButton(
                  child: Text("Send", style: buttonTextStyle),
                  onPressed: () => setState(() => list.add(controller.text)),
                  color: Theme.of(context).accentColor,
                ),
                SizedBox(width: 10)
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (_, index) {
                  return Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    margin: EdgeInsets.only(
                        bottom: index == list.length - 1 ? 0 : 10),
                    alignment: Alignment.centerLeft,
                    height: 50,
                    decoration: BoxDecoration(
                      color:
                          index % 2 == 0 ? Colors.orange : Colors.yellowAccent,
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(list[index], style: TextStyle(fontSize: 18)),
                        RaisedButton(
                          child: Text("Delete", style: buttonTextStyle),
                          onPressed: () => setState(() => list.removeAt(index)),
                          color: Colors.red,
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
