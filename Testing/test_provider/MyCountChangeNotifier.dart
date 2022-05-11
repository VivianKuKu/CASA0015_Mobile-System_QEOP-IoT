import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math';

class MyCountChangeNotifier with ChangeNotifier {
  List<Map<String, dynamic>> products = [];
  List<Container> containerList = [
    // createNewContainer(),
    // createNewContainer(),
  ];
  List<Widget> _childrenList() {
    return containerList;
  }

  void addProduct(Map<String, dynamic> product) {
    products.add(product);
    notifyListeners();
  }

  void addContainer() {
    containerList.add(createNewContainer());
  }

  Container createNewContainer() {
    return Container(
      height: 100,
      width: 500,
      color: Color.fromARGB(
        255,
        Random().nextInt(256),
        Random().nextInt(256),
        Random().nextInt(256),
      ),
      child: Text(
        '${products}',
        style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontFamily: 'Comfortaa',
            fontSize: 15,
            letterSpacing: -0.3,
            fontWeight: FontWeight.normal,
            height: 1),
      ),
    );
  }
}
