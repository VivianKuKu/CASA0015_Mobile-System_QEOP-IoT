import 'package:flutter/material.dart';
import 'log_detail.dart';
import 'profile.dart';
import 'package:provider/provider.dart';
import 'BPage.dart';

class MyChangeNotifier with ChangeNotifier {
  List<Map<String, dynamic>> logs = []; //123
  List<Container> containerList = [];

  int container_count = 0; //12345

  void addLog(Map<String, dynamic> log) {
    //123
    logs.add(log); //123
    notifyListeners();
  }

  void addContainer() {
    containerList.add(createNewContainer());
    container_count += 1; //12345
  }

  // Widget build(BuildContext context) {
  //   final getData = Provider.of<MyChangeNotifier>(context); //neww
  //   void goto_LogDetail() {
  //     Navigator.push(context,
  //         MaterialPageRoute(builder: (context) => ProfilePage(containerList)));
  //   }
  // }

  Container createNewContainer() {
    return Container(
      height: 285,
      width: 500,
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: 20, top: 15, right: 20, bottom: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(49, 0, 0, 0),
            offset: Offset(0, 5),
            blurRadius: 40,
          )
        ],
        color: Colors.white,
        border: Border.all(
          color: Color.fromRGBO(149, 149, 149, 1),
          width: 0.2,
        ),
      ),
      child: GestureDetector(
          child: Stack(
        children: <Widget>[
          Positioned(
            top: 25,
            left: 30,
            child: Text(
              '${logs[container_count]['Project ID']}', //123 //12345
              style: TextStyle(
                  color: Color.fromARGB(255, 41, 41, 41),
                  fontFamily: 'Comfortaa',
                  fontSize: 22,
                  letterSpacing: -0.3,
                  fontWeight: FontWeight.bold,
                  height: 1),
            ),
          ),
          Positioned(
              top: 65,
              left: 30,
              child: Text(
                'Vivian Ku',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromARGB(255, 41, 41, 41),
                    fontFamily: 'Comfortaa',
                    fontSize: 18,
                    letterSpacing: -0.3,
                    fontWeight: FontWeight.bold,
                    height: 1),
              )),
          Positioned(
              top: 95,
              left: 30,
              child: Text(
                '${logs[container_count]['Date']}',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromARGB(255, 41, 41, 41),
                    fontFamily: 'Comfortaa',
                    fontSize: 16,
                    letterSpacing: -0.3,
                    fontWeight: FontWeight.normal,
                    height: 1),
              )),
          Positioned(
              top: 115,
              left: 30,
              child: Text(
                '${logs[container_count]['Time']}',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromARGB(255, 41, 41, 41),
                    fontFamily: 'Comfortaa',
                    fontSize: 16,
                    letterSpacing: -0.3,
                    fontWeight: FontWeight.normal,
                    height: 1),
              )),
          Positioned(
              top: 165,
              left: 30,
              child: Text(
                'Description',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromARGB(255, 41, 41, 41),
                    fontFamily: 'Comfortaa',
                    fontSize: 18,
                    letterSpacing: -0.3,
                    fontWeight: FontWeight.bold,
                    height: 1),
              )),
          Positioned(
              top: 195,
              left: 30,
              child: Container(
                  constraints: BoxConstraints(
                    minWidth: 160.0,
                    maxWidth: 160.0,
                  ),
                  child: Text(
                    '${logs[container_count]['description']}',
                    textAlign: TextAlign.left,
                    // overflow: TextOverflow.ellipsis,
                    overflow: TextOverflow.fade,
                    maxLines: 2,
                    // softWrap: false,
                    style: TextStyle(
                        color: Color.fromARGB(255, 41, 41, 41),
                        fontFamily: 'Comfortaa',
                        fontSize: 16,
                        letterSpacing: -0.3,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  ))),
          Positioned(
              top: 25,
              left: 200,
              child: Container(
                  width: 150,
                  height: 185,
                  // color: Colors.black,
                  // child: Image(
                  //   image: AssetImage('assets/images/WST.jpg'),
                  //   fit: BoxFit.contain,
                  // )
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/WST.jpg'),
                        fit: BoxFit.contain),
                  ))),
        ],
      )),
    );
  }
}
