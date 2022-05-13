// import 'package:flutter/material.dart';
// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'dart:async';
// import 'package:intl/intl.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';
// import 'package:provider/provider.dart';
// import 'MyChangeNotifier.dart';

// class LogDetailPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final getData = Provider.of<MyChangeNotifier>(context);

//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Create', style: TextStyle(color: Colors.black)),
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
//             child: Consumer<MyChangeNotifier>(builder: (context, getdata, _) {
//           return Container(
//               height: 1110, //NEED TO CHANGE!
//               child: Stack(children: <Widget>[
//                 Align(
//                     alignment: Alignment.center,
//                     child: Container(
//                       margin: const EdgeInsets.only(top: 840),
//                       width: 343,
//                       height: 45,
//                       child: RaisedButton(
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(5.0),
//                             side: BorderSide(
//                                 color: Color.fromARGB(255, 0, 0, 0))),
//                         onPressed: btnClickEvent_create, //neww
//                         padding: EdgeInsets.all(10.0),
//                         color: Color.fromARGB(255, 0, 0, 0),
//                         textColor: Colors.white,
//                         child: Text("CREATE",
//                             style: TextStyle(
//                                 fontSize: 18,
//                                 color: Color.fromRGBO(255, 255, 255, 1),
//                                 fontFamily: 'Comfortaa',
//                                 fontWeight: FontWeight.normal,
//                                 height: 1)),
//                       ),
//                     )),
//                 ////NAME////
//                 Positioned(
//                     top: 33, //163
//                     left: 33,
//                     child: Text(
//                       'Name',
//                       textAlign: TextAlign.left,
//                       style: TextStyle(
//                           color: Color.fromRGBO(35, 35, 35, 1),
//                           fontFamily: 'Comfortaa',
//                           fontSize: 18,
//                           letterSpacing: -0.30000001192092896,
//                           fontWeight: FontWeight.bold,
//                           height: 1),
//                     )),
//                 ////DEVICE ID////
//                 Positioned(
//                     top: 151,
//                     left: 33,
//                     child: Text(
//                       'Device ID',
//                       textAlign: TextAlign.left,
//                       style: TextStyle(
//                           color: Color.fromRGBO(35, 35, 35, 1),
//                           fontFamily: 'Comfortaa',
//                           fontSize: 18,
//                           letterSpacing: -0.30000001192092896,
//                           fontWeight: FontWeight.bold,
//                           height: 1),
//                     )),
//                 Positioned(
//                     top: 95,
//                     left: 33,
//                     child: Text(
//                       'Project ID',
//                       textAlign: TextAlign.left,
//                       style: TextStyle(
//                           color: Color.fromRGBO(35, 35, 35, 1),
//                           fontFamily: 'Comfortaa',
//                           fontSize: 18,
//                           letterSpacing: -0.30000001192092896,
//                           fontWeight: FontWeight.bold,
//                           height: 1),
//                     )),
//                 ////DESCRIPTION////
//                 Positioned(
//                     top: 341,
//                     left: 33,
//                     child: Text(
//                       'Descreption',
//                       textAlign: TextAlign.left,
//                       style: TextStyle(
//                           color: Color.fromRGBO(35, 35, 35, 1),
//                           fontFamily: 'Comfortaa',
//                           fontSize: 18,
//                           letterSpacing: -0.30000001192092896,
//                           fontWeight: FontWeight.bold,
//                           height: 1),
//                     )),
//                 ////ATTACHMENT////
//                 Positioned(
//                     top: 525,
//                     left: 33,
//                     child: Text(
//                       'Attachment',
//                       textAlign: TextAlign.left,
//                       style: TextStyle(
//                           color: Color.fromRGBO(35, 35, 35, 1),
//                           fontFamily: 'Comfortaa',
//                           fontSize: 18,
//                           letterSpacing: -0.30000001192092896,
//                           fontWeight: FontWeight.bold,
//                           height: 1),
//                     )),

//                 ////DATE////
//                 Positioned(
//                     top: 222,
//                     left: 33,
//                     child: Container(
//                       decoration: BoxDecoration(),
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: <Widget>[
//                           Text(
//                             'Date',
//                             textAlign: TextAlign.left,
//                             style: TextStyle(
//                                 color: Color.fromRGBO(35, 35, 35, 1),
//                                 fontFamily: 'Comfortaa',
//                                 fontSize: 18,
//                                 letterSpacing: 0,
//                                 fontWeight: FontWeight.bold,
//                                 height: 1.5 /*PERCENT not supported*/
//                                 ),
//                           ),
//                         ],
//                       ),
//                     )),
//                 ////TIME////
//                 Positioned(
//                     top: 222,
//                     left: 210,
//                     child: Text(
//                       'Time',
//                       textAlign: TextAlign.left,
//                       style: TextStyle(
//                           color: Color.fromRGBO(35, 35, 35, 1),
//                           fontFamily: 'Comfortaa',
//                           fontSize: 18,
//                           letterSpacing: 0,
//                           fontWeight: FontWeight.bold,
//                           height: 1.5 /*PERCENT not supported*/
//                           ),
//                     )),
//                 ////USER NAME////
//                 Positioned(
//                     top: 29,
//                     left: 302,
//                     child: Text(
//                       'Vivian Ku',
//                       textAlign: TextAlign.left,
//                       style: TextStyle(
//                           color: Color.fromRGBO(35, 35, 35, 1),
//                           fontFamily: 'Comfortaa',
//                           fontSize: 18,
//                           letterSpacing: 0,
//                           fontWeight: FontWeight.normal,
//                           height: 1.5 /*PERCENT not supported*/
//                           ),
//                     )),
//                 ////SELECT A DATE////
//                 Positioned(
//                     top: 260,
//                     left: 33,
//                     child: Container(
//                       width: 165,
//                       height: 42,
//                       child: RaisedButton(
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(0),
//                         ),
//                         color: Colors.black, //Button Background colour
//                         textColor: Colors.white, //Button Text colour
//                         onPressed: () => _showDatePicker(),
//                         child: Text(" ${selectedDate ?? "Select a Date"}"),
//                       ),
//                     )),

//                 ////SELECT A TIME////
//                 Positioned(
//                     top: 260,
//                     left: 213,
//                     child: Container(
//                       width: 165,
//                       height: 42,
//                       child: RaisedButton(
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(0),
//                         ),
//                         color: Colors.black, //Button Background colour
//                         textColor: Colors.white, //Button Text colour
//                         onPressed: () => _showTimePicker(),
//                         child: Text(" ${selectedTime ?? "Select a Time"}"),
//                       ),
//                     )),

//                 ////DESCRIPTION TEXT FILED////
//                 Align(
//                     // top: 378,
//                     // left: 33,
//                     alignment: Alignment.center,
//                     child: Container(
//                       margin: const EdgeInsets.only(bottom: 200),
//                       width: 343,
//                       height: 155,
//                       child: TextField(
//                         controller: myController_description,
//                         decoration: InputDecoration(
//                           hintText: 'Text here...',
//                           border: const OutlineInputBorder(),
//                           //Before click on text field
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(16.0),
//                             borderSide: const BorderSide(
//                                 color: Color.fromARGB(255, 0, 0, 0),
//                                 width: 1.0),
//                           ),
//                           //After click on text field
//                           focusedBorder: new OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(16.0),
//                             borderSide: BorderSide(
//                                 color: Color.fromARGB(255, 0, 0, 0),
//                                 width: 1.0),
//                           ),
//                         ),
//                         maxLines: 4,
//                         style: TextStyle(
//                           fontFamily: 'Comfortaa',
//                           color: Color.fromARGB(255, 62, 62, 62),
//                           fontWeight: FontWeight.normal,
//                         ),
//                       ),
//                     )),
//                 ////ATTACHMENT HOLDER////
//                 ///
//                 // Positioned(
//                 //     top: 873,
//                 //     left: 194,
//                 //     child:
//                 Align(
//                   alignment: Alignment.center,
//                   child: Stack(
//                       // alignment: Alignment.topLeft,
//                       children: <Widget>[
//                         Container(
//                           // top: 623,
//                           // left: 33,
//                           margin: const EdgeInsets.only(top: 430),
//                           width: 343,
//                           height: 325,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(16),
//                               border: Border.all(
//                                 color: Color.fromARGB(255, 0, 0, 0),
//                                 width: 1.0,
//                               )),
//                           child: _ImageView(_imgPath),
//                         ),
//                         Container(
//                           // top: 553,
//                           // left: 43,
//                           margin: const EdgeInsets.only(top: 370),
//                           child: RaisedButton(
//                             onPressed: _takePhoto,
//                             child: Text("Take Photo"),
//                           ),
//                         ),
//                         Container(
//                           // top: 553,
//                           // left: 183,
//                           margin: const EdgeInsets.only(top: 370, left: 150),
//                           child: RaisedButton(
//                             onPressed: _openGallery,
//                             child: Text("Pick from Library"),
//                           ),
//                         ),
//                       ]),
//                 ),

//                 ////Select a Project////
//                 Positioned(
//                     top: 82,
//                     left: 159,
//                     child: Container(
//                         width: 220,
//                         height: 42,
//                         child: Stack(children: <Widget>[
//                           Positioned(
//                               top: 0, //31
//                               left: 0, //10
//                               child: DropdownButtonHideUnderline(
//                                 child: DropdownButton2(
//                                   isExpanded: true,
//                                   hint: Row(
//                                     children: const [
//                                       SizedBox(
//                                         width: 4,
//                                       ),
//                                       Expanded(
//                                         child: Text(
//                                           'Select a Project',
//                                           style: TextStyle(
//                                             fontFamily: 'Comfortaa',
//                                             fontSize: 14,
//                                             fontWeight: FontWeight.normal,
//                                             color: Color.fromARGB(
//                                                 255, 150, 150, 150), //Hint Text
//                                           ),
//                                           overflow: TextOverflow.ellipsis,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   items: projectlist
//                                       .map((item) => DropdownMenuItem<String>(
//                                             value: item,
//                                             child: Text(
//                                               item,
//                                               style: const TextStyle(
//                                                 fontSize: 16,
//                                                 fontWeight: FontWeight.normal,
//                                                 color: Color.fromARGB(255, 0, 0,
//                                                     0), //Font colour of dropdown menu
//                                               ),
//                                               overflow: TextOverflow.ellipsis,
//                                             ),
//                                           ))
//                                       .toList(),
//                                   value: selectedValue,
//                                   onChanged: (value) {
//                                     setState(() {
//                                       selectedValue = value as String;
//                                     });
//                                   },
//                                   buttonHeight: 40,
//                                   buttonWidth: 220,
//                                   buttonPadding: const EdgeInsets.only(
//                                       left: 14, right: 14),
//                                   buttonDecoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(
//                                         0), //Botton border radius
//                                     border: Border.all(
//                                       color: Color.fromARGB(255, 28, 28,
//                                           28), //Button border colour
//                                       width: 0.8,
//                                     ),
//                                     color: Color.fromARGB(255, 255, 255,
//                                         255), //Button background colour
//                                   ),
//                                   // buttonElevation: 2,
//                                   itemHeight: 40, //line heights of list
//                                   itemPadding: const EdgeInsets.only(
//                                       left: 14, right: 14),
//                                   dropdownMaxHeight: 200,
//                                   dropdownWidth: 220,
//                                   dropdownPadding: null,
//                                   dropdownDecoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(
//                                         5), //Dropdown border radius
//                                     color: Color.fromARGB(255, 255, 255,
//                                         255), //dropdown menu background colour
//                                   ),
//                                   dropdownElevation: 8,
//                                   scrollbarRadius: const Radius.circular(40),
//                                   scrollbarThickness: 6,
//                                   scrollbarAlwaysShow: true,
//                                   offset: const Offset(0,
//                                       -5), //Offset from the button and dropdown list
//                                 ),
//                               )),
//                         ]))),
//                 ////Select a Device////
//                 Positioned(
//                     top: 137,
//                     left: 159,
//                     child: Container(
//                         width: 220,
//                         height: 42,
//                         // decoration: BoxDecoration(
//                         //   color: Color.fromARGB(255, 148, 49, 49),
//                         // ),
//                         child: Stack(children: <Widget>[
//                           Positioned(
//                               top: 0, //31
//                               left: 0, //10
//                               child: DropdownButtonHideUnderline(
//                                 child: DropdownButton2(
//                                   isExpanded: true,
//                                   hint: Row(
//                                     children: const [
//                                       // Icon(
//                                       //   Icons.list,
//                                       //   size: 16,
//                                       //   color: Color.fromARGB(
//                                       //       255, 150, 150, 150),
//                                       // ),
//                                       SizedBox(
//                                         width: 4,
//                                       ),
//                                       Expanded(
//                                         child: Text(
//                                           'Select a Device',
//                                           style: TextStyle(
//                                             fontFamily: 'Comfortaa',
//                                             fontSize: 14,
//                                             fontWeight: FontWeight.normal,
//                                             color: Color.fromARGB(
//                                                 255, 150, 150, 150), //Hint Text
//                                           ),
//                                           overflow: TextOverflow.ellipsis,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   items: devicelist
//                                       .map((item2) => DropdownMenuItem<String>(
//                                             value: item2,
//                                             child: Text(
//                                               item2,
//                                               style: const TextStyle(
//                                                 fontSize: 16,
//                                                 fontWeight: FontWeight.normal,
//                                                 color: Color.fromARGB(255, 0, 0,
//                                                     0), //Dropdown text colour
//                                               ),
//                                               overflow: TextOverflow.ellipsis,
//                                             ),
//                                           ))
//                                       .toList(),
//                                   value: selectedValue2,
//                                   onChanged: (value) {
//                                     setState(() {
//                                       selectedValue2 = value as String;
//                                     });
//                                   },
//                                   buttonHeight: 40,
//                                   buttonWidth: 220,
//                                   buttonPadding: const EdgeInsets.only(
//                                       left: 14, right: 14),
//                                   buttonDecoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(
//                                         0), //Botton border radius
//                                     border: Border.all(
//                                       color: Color.fromARGB(255, 28, 28,
//                                           28), //Button border colour
//                                       width: 0.8, //Button border stroke
//                                     ),
//                                     color: Color.fromARGB(255, 255, 255,
//                                         255), //Button background colour
//                                   ),
//                                   // buttonElevation: 2,
//                                   itemHeight: 40, //line heights of list
//                                   itemPadding: const EdgeInsets.only(
//                                       left: 14, right: 14),
//                                   dropdownMaxHeight: 200,
//                                   dropdownWidth: 220,
//                                   dropdownPadding: null,
//                                   dropdownDecoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(
//                                         5), //Dropdown border radius
//                                     color: Color.fromARGB(255, 255, 255,
//                                         255), //Dropdown background colour
//                                   ),
//                                   dropdownElevation: 8,
//                                   scrollbarRadius: const Radius.circular(40),
//                                   scrollbarThickness: 6,
//                                   scrollbarAlwaysShow: true,
//                                   offset: const Offset(0,
//                                       -5), //Offset from the button and dropdown list
//                                 ),
//                               )),
//                         ]))),
//               ]));
//         })));
//   }
// }
