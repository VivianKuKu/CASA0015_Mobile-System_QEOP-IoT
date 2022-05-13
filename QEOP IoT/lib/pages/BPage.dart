import 'package:flutter/material.dart';

class BPage extends StatelessWidget {
  int intVal;
  String strVal;

  BPage({Key? key, required this.intVal, required this.strVal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我是 B 頁'),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('intVal: $intVal'),
              Text('strVal: $strVal')
            ]),
      ),
    );
  }
}
