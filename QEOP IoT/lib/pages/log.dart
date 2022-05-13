import 'package:flutter/material.dart';
import 'dart:math';

class LogPage extends StatefulWidget {
  @override
  _LogPageState createState() => _LogPageState();
}

//Container (card)
// Container createNewContainer() {
//   return Container(
//       // width: 1097, //697
//       height: 210, //Need to be same as Background card's height
//       margin: const EdgeInsets.only(bottom: 10, top: 12),
//       child: Stack(children: <Widget>[
//         ////Background Card////
//         Positioned(
//             top: 0,
//             left: 28,
//             child: Container(
//                 width: 354,
//                 height: 210,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(16),
//                     topRight: Radius.circular(16),
//                     bottomLeft: Radius.circular(16),
//                     bottomRight: Radius.circular(16),
//                   ),
//                   boxShadow: [
//                     BoxShadow(
//                         color: Color.fromRGBO(0, 0, 0, 0.1),
//                         offset: Offset(0, 1),
//                         blurRadius: 50)
//                   ],
//                   color: Color.fromRGBO(255, 255, 255, 1),
//                   border: Border.all(
//                     color: Color.fromRGBO(149, 149, 149, 1),
//                     width: 0.2,
//                   ),
//                 ))),
//         Positioned(
//             top: 24,
//             left: 40,
//             child: Container(
//                 width: 164,
//                 height: 160,
//                 child: Stack(children: <Widget>[
//                   ////Project ID////
//                   Positioned(
//                       top: 0,
//                       left: 4,
//                       child: Text(
//                         'Smart Bat Monitor',
//                         textAlign: TextAlign.left,
//                         style: TextStyle(
//                             color: Color.fromRGBO(35, 35, 35, 1),
//                             fontFamily: 'Comfortaa',
//                             fontSize: 15,
//                             letterSpacing: -0.3,
//                             fontWeight: FontWeight.normal,
//                             height: 1),
//                       )),
//                   ////Description////
//                   Positioned(
//                       top: 80,
//                       left: 4,
//                       child: Text(
//                         'Description:',
//                         textAlign: TextAlign.left,
//                         style: TextStyle(
//                             color: Color.fromRGBO(35, 35, 35, 1),
//                             fontFamily: 'Comfortaa',
//                             fontSize: 12,
//                             letterSpacing: -0.3,
//                             fontWeight: FontWeight.normal,
//                             height: 1),
//                       )),
//                   ////Description Text////
//                   Positioned(
//                       top: 107,
//                       left: 4,
//                       child: Text(
//                         'Ham House is a 17th-century house set in formal gardens on the bank of the River Thames in Ham, London... [read more]',
//                         textAlign: TextAlign.justify,
//                         style: TextStyle(
//                             color: Color.fromRGBO(35, 35, 35, 1),
//                             fontFamily: 'Comfortaa',
//                             fontSize: 10,
//                             letterSpacing: -0.3,
//                             fontWeight: FontWeight.normal,
//                             height: 1),
//                       )),
//                 ]))),
//         ////ATTACHMENT////
//         Positioned(
//             top: 24,
//             left: 188,
//             child: Container(
//                 width: 153,
//                 height: 153,
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                       image: AssetImage('assets/images/Rectangle28.png'),
//                       fit: BoxFit.fitWidth),
//                 ))),
//       ]));
// }

// class _LogPageState extends State<LogPage> {
//   List<Container> containerList = [
//     createNewContainer(),
//     createNewContainer(),
//   ];

//   // Add
//   void addContainer() {
//     containerList.add(createNewContainer());
//   }

//   // Pop
//   void popContainer() {
//     containerList.removeLast();
//   }

//   // _childrenList
//   List<Widget> _childrenList() {
//     return containerList;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Log', style: TextStyle(color: Colors.black)),
//           elevation: 1, //shadow of the appBar
//           centerTitle: false, //title align to left
//           leading: Builder(
//             builder: (BuildContext context) {
//               return IconButton(
//                 icon: const Icon(Icons.book),
//                 color: Colors.black,
//                 onPressed: () {
//                   Scaffold.of(context).openDrawer();
//                 },
//                 tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
//               );
//             },
//           ),
//           backgroundColor: Color.fromARGB(255, 255, 255, 255),
//         ),
//         body: SingleChildScrollView(
//             child: Center(
//                 child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           // crossAxisAlignment: CrossAxisAlignment.end,
//           children: _childrenList(),
//         ))),
//         floatingActionButton: Column(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             FloatingActionButton(
//               backgroundColor: Colors.black,
//               onPressed: () {
//                 setState(() {
//                   addContainer();
//                 });
//               },
//               child: Icon(Icons.add),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             FloatingActionButton(
//               backgroundColor: Colors.grey,
//               onPressed: () {
//                 setState(() {
//                   popContainer();
//                 });
//               },
//               child: Icon(Icons.remove),
//             )
//           ],
//         ));
//   }
// }

class _LogPageState extends State<LogPage> {
  // final List<Map<String, String>> products; //neww
  int? intVal;
  String? strProjectID;
  String? strDeviceID;
  String? strDate;
  String? strTime;

  _LogPageState(
      {Key? key,
      this.intVal,
      this.strProjectID,
      this.strDeviceID,
      this.strDate,
      this.strTime});
  // : super(key: key); //neww

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log', style: TextStyle(color: Colors.black)),
        elevation: 1, //shadow of the appBar
        centerTitle: false, //title align to left
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.book),
              color: Colors.black,
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('intVal: $intVal'),
              Text('Project ID: $strProjectID'),
              Text('Device ID: $strDeviceID'),
              Text('Date: $strDate'),
              Text('Time: $strTime'),
            ]),
      ),
    );
  }
}
