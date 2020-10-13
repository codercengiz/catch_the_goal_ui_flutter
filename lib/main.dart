import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Dismissible(
            background: Container(
              color: Colors.deepOrange,
              child: Text("datara"),
            ),
            key: UniqueKey(),
            child: buildc,
          ),
        ),
      ),
    );
  }
}
