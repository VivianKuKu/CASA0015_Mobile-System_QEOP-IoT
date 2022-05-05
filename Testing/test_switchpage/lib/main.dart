import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'pages/tabs.dart';

//////////////
// Material///
//////////////

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // primaryColor: Colors.blue,
      ),
      home: Tabs(),
    );
  }
}

//////////////
//Cupertino///
//////////////

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   static const String _title = 'Flutter Code Sample';

//   @override
//   Widget build(BuildContext context) {
//     return CupertinoApp(
//       title: _title,
//       home: Tabs(),
//     );
//   }
// }
