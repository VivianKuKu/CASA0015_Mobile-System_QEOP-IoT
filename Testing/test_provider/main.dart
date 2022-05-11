import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'pages/tabs.dart';
import 'package:here_sdk/core.dart';
import 'package:here_sdk/mapview.dart';
import 'package:provider/provider.dart';
import '/pages/MyCountChangeNotifier.dart';

void main() {
  runApp(MyApp());
  SdkContext.init(IsolateOrigin.main); //new add for Here Maps
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         // primaryColor: Colors.blue,
//       ),
//       home: Tabs(),
//     );
//   }
// }

class MyApp extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  // List<Map<String, String>> _products = [];

  // void _addProduct(Map<String, String> product) {
  //   setState(() {
  //     _products.add(product);
  //   });
  // }

  // void _deleteProduct(int index) {
  //   setState(() {
  //     _products.removeAt(index);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //     // primaryColor: Colors.blue,
    //   ),
    //   home: Tabs(),
    // );
    return MultiProvider(
      providers: [ChangeNotifierProvider.value(value: MyCountChangeNotifier())],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          // primaryColor: Colors.blue,
        ),
        home: Tabs(),
      ),
    );
  }
}
