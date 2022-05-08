import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CreatePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CreatePageState();
  }
}

class _CreatePageState extends State<CreatePage> {
  // Dropdown Lists
  String? selectedValue; //Project ID
  String? selectedValue2; //Device ID
  List<String> projectlist = [
    'Project1',
    'Project2',
    'Project3',
    'Project4',
    'Project5',
    'Project6'
  ];
  List<String> devicelist = ['Device1', 'Device2', 'Device3'];

  // Date Function
  String? selectedDate;
  String? selectedTime;

  Future<void> _showDatePicker() async {
    final DateTime? _picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark(),
          child: child!,
        );
      },
    );

    if (_picked != null) {
      setState(() {
        selectedDate = DateFormat("yyyy-MM-dd").format(_picked);
      });
    }
  }

  // Time Function
  Future<void> _showTimePicker() async {
    final TimeOfDay? _picked2 = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: 5, minute: 10),
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark(),
          child: child!,
        );
      },
    );
    if (_picked2 != null) {
      setState(() {
        selectedTime = _picked2.format(context);
      });
    }
  }

  // Description- Text Field
  final TextEditingController myController = new TextEditingController();

  //Take photo or Pick from Library
  XFile? _imgPath;
  final ImagePicker _picker = ImagePicker();
  Future<PickedFile>? file;

  //Widget build
  @override
  Widget build(BuildContext context) {
    void btnClickEvent() {
      print('CREATE A LOG!!!!!...');
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('Create', style: TextStyle(color: Colors.black)),
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
        body: SingleChildScrollView(
            child: Container(
                // width: 375,
                height: 1500, //NEED TO CHANGE!
                child: Stack(children: <Widget>[
                  ////Create Log Button////
                  Positioned(
                      top: 986,
                      left: 20,
                      child: Container(
                        width: 235,
                        height: 45,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              side: BorderSide(
                                  color: Color.fromARGB(255, 0, 0, 0))),
                          onPressed: btnClickEvent,
                          padding: EdgeInsets.all(10.0),
                          color: Color.fromARGB(255, 0, 0, 0),
                          textColor: Colors.white,
                          child: Text("CREATE",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  fontFamily: 'Comfortaa',
                                  fontWeight: FontWeight.normal,
                                  height: 1)),
                        ),
                      )),
                  ////NAME////
                  Positioned(
                      top: 33, //163
                      left: 23,
                      child: Text(
                        'Name',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromRGBO(35, 35, 35, 1),
                            fontFamily: 'Comfortaa',
                            fontSize: 15,
                            letterSpacing: -0.30000001192092896,
                            fontWeight: FontWeight.bold,
                            height: 1),
                      )),
                  ////DEVICE ID////
                  Positioned(
                      top: 151,
                      left: 23,
                      child: Text(
                        'Device ID',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromRGBO(35, 35, 35, 1),
                            fontFamily: 'Comfortaa',
                            fontSize: 15,
                            letterSpacing: -0.30000001192092896,
                            fontWeight: FontWeight.bold,
                            height: 1),
                      )),
                  Positioned(
                      top: 95,
                      left: 23,
                      child: Text(
                        'Project ID',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromRGBO(35, 35, 35, 1),
                            fontFamily: 'Comfortaa',
                            fontSize: 15,
                            letterSpacing: -0.30000001192092896,
                            fontWeight: FontWeight.bold,
                            height: 1),
                      )),
                  ////DESCRIPTION////
                  Positioned(
                      top: 341,
                      left: 23,
                      child: Text(
                        'Descreption',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromRGBO(35, 35, 35, 1),
                            fontFamily: 'Comfortaa',
                            fontSize: 15,
                            letterSpacing: -0.30000001192092896,
                            fontWeight: FontWeight.bold,
                            height: 1),
                      )),
                  ////ATTACHMENT////
                  Positioned(
                      top: 525,
                      left: 23,
                      child: Text(
                        'Attachment',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromRGBO(35, 35, 35, 1),
                            fontFamily: 'Comfortaa',
                            fontSize: 15,
                            letterSpacing: -0.30000001192092896,
                            fontWeight: FontWeight.bold,
                            height: 1),
                      )),

                  ////DATE////
                  Positioned(
                      top: 222,
                      left: 23,
                      child: Container(
                        decoration: BoxDecoration(),
                        // padding:
                        //     EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              'Date',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(35, 35, 35, 1),
                                  fontFamily: 'Comfortaa',
                                  fontSize: 15,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.bold,
                                  height: 1.5 /*PERCENT not supported*/
                                  ),
                            ),
                          ],
                        ),
                      )),
                  ////TIME////
                  Positioned(
                      top: 222,
                      left: 190,
                      child: Text(
                        'Time',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromRGBO(35, 35, 35, 1),
                            fontFamily: 'Comfortaa',
                            fontSize: 15,
                            letterSpacing: 0,
                            fontWeight: FontWeight.bold,
                            height: 1.5 /*PERCENT not supported*/
                            ),
                      )),
                  ////USER NAME////
                  Positioned(
                      top: 29,
                      left: 272,
                      child: Text(
                        'Vivian Ku',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromRGBO(35, 35, 35, 1),
                            fontFamily: 'Comfortaa',
                            fontSize: 16,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                            height: 1.5 /*PERCENT not supported*/
                            ),
                      )),
                  ////SELECT A DATE////
                  Positioned(
                      top: 260,
                      left: 23,
                      child: Container(
                        width: 155,
                        height: 42,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                          color: Colors.black, //Button Background colour
                          textColor: Colors.white, //Button Text colour
                          onPressed: () => _showDatePicker(),
                          child: Text(" ${selectedDate ?? "Select a Date"}"),
                        ),
                      )),

                  ////SELECT A TIME////
                  Positioned(
                      top: 260,
                      left: 193,
                      child: Container(
                        width: 155,
                        height: 42,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                          color: Colors.black, //Button Background colour
                          textColor: Colors.white, //Button Text colour
                          onPressed: () => _showTimePicker(),
                          child: Text(" ${selectedTime ?? "Select a Time"}"),
                        ),
                      )),

                  ////DESCRIPTION TEXT FILED////
                  Positioned(
                      top: 378,
                      left: 23,
                      child: Container(
                        width: 323,
                        height: 155,
                        child: TextField(
                          controller: myController,
                          decoration: InputDecoration(
                            hintText: 'Text here',
                            border: const OutlineInputBorder(),
                            //Before click on text field
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.0),
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  width: 0.8),
                            ),
                            //After click on text field
                            focusedBorder: new OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.0),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  width: 1.5),
                            ),
                          ),
                          maxLines: 4,
                          style: TextStyle(
                            fontFamily: 'Comfortaa',
                            color: Color.fromARGB(255, 62, 62, 62),
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      )),
                  ////ATTACHMENT HOLDER//// //neww
                  // Positioned(
                  //     top: 873,
                  //     left: 194,
                  //     child:
                  Center(
                    child: Stack(
                        // alignment: Alignment.topLeft,
                        children: <Widget>[
                          // Positioned(
                          //   top: 563,
                          //   left: 23,
                          //   child: Container(
                          //     width: 323,
                          //     height: 325,
                          //     decoration: BoxDecoration(
                          //         borderRadius: BorderRadius.circular(16),
                          //         border: Border.all(
                          //           color: Color.fromARGB(255, 0, 0, 0),
                          //           width: 0.8,
                          //         )),
                          //     // child: Image.file(
                          //     //   _imgPath,
                          //     //   fit: BoxFit.cover,
                          //     //   width: 300,
                          //     //   height: 300,
                          //     // ),
                          //   ),
                          // ),
                          Positioned(
                              top: 623,
                              left: 23,
                              child: Container(
                                width: 323,
                                height: 325,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      width: 0.8,
                                    )),
                                child: _ImageView(_imgPath), //neww
                              )),
                          Positioned(
                            top: 553,
                            left: 43,
                            child: RaisedButton(
                              onPressed: _takePhoto,
                              child: Text("Take Photo"),
                            ),
                          ),
                          Positioned(
                            top: 553,
                            left: 183,
                            child: RaisedButton(
                              onPressed: _openGallery,
                              child: Text("Pick from Library"),
                            ),
                          ),
                        ]),
                  ),

                  ////Select a Project////
                  Positioned(
                      top: 82,
                      left: 139,
                      child: Container(
                          width: 220,
                          height: 42,
                          // decoration: BoxDecoration(
                          //   color: Color.fromARGB(255, 148, 49, 49),
                          // ),
                          child: Stack(children: <Widget>[
                            Positioned(
                                top: 0, //31
                                left: 0, //10
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton2(
                                    isExpanded: true,
                                    hint: Row(
                                      children: const [
                                        // Icon(
                                        //   Icons.list,
                                        //   size: 16,
                                        //   color: Color.fromARGB(
                                        //       255, 150, 150, 150), //Icon colour
                                        // ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        Expanded(
                                          child: Text(
                                            'Select a Project',
                                            style: TextStyle(
                                              fontFamily: 'Comfortaa',
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                              color: Color.fromARGB(255, 150,
                                                  150, 150), //Hint Text
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                    items: projectlist
                                        .map((item) => DropdownMenuItem<String>(
                                              value: item,
                                              child: Text(
                                                item,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255,
                                                      0,
                                                      0,
                                                      0), //Font colour of dropdown menu
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ))
                                        .toList(),
                                    value: selectedValue,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedValue = value as String;
                                      });
                                    },
                                    buttonHeight: 40,
                                    buttonWidth: 220,
                                    buttonPadding: const EdgeInsets.only(
                                        left: 14, right: 14),
                                    buttonDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          0), //Botton border radius
                                      border: Border.all(
                                        color: Color.fromARGB(255, 28, 28,
                                            28), //Button border colour
                                        width: 0.8,
                                      ),
                                      color: Color.fromARGB(255, 255, 255,
                                          255), //Button background colour
                                    ),
                                    // buttonElevation: 2,
                                    itemHeight: 40, //line heights of list
                                    itemPadding: const EdgeInsets.only(
                                        left: 14, right: 14),
                                    dropdownMaxHeight: 200,
                                    dropdownWidth: 220,
                                    dropdownPadding: null,
                                    dropdownDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          5), //Dropdown border radius
                                      color: Color.fromARGB(255, 255, 255,
                                          255), //dropdown menu background colour
                                    ),
                                    dropdownElevation: 8,
                                    scrollbarRadius: const Radius.circular(40),
                                    scrollbarThickness: 6,
                                    scrollbarAlwaysShow: true,
                                    offset: const Offset(0,
                                        -5), //Offset from the button and dropdown list
                                  ),
                                )),
                          ]))),
                  ////Select a Device////
                  Positioned(
                      top: 137,
                      left: 139,
                      child: Container(
                          width: 220,
                          height: 42,
                          // decoration: BoxDecoration(
                          //   color: Color.fromARGB(255, 148, 49, 49),
                          // ),
                          child: Stack(children: <Widget>[
                            Positioned(
                                top: 0, //31
                                left: 0, //10
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton2(
                                    isExpanded: true,
                                    hint: Row(
                                      children: const [
                                        // Icon(
                                        //   Icons.list,
                                        //   size: 16,
                                        //   color: Color.fromARGB(
                                        //       255, 150, 150, 150),
                                        // ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        Expanded(
                                          child: Text(
                                            'Select a Device',
                                            style: TextStyle(
                                              fontFamily: 'Comfortaa',
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                              color: Color.fromARGB(255, 150,
                                                  150, 150), //Hint Text
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                    items: devicelist
                                        .map((item2) =>
                                            DropdownMenuItem<String>(
                                              value: item2,
                                              child: Text(
                                                item2,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255,
                                                      0,
                                                      0,
                                                      0), //Dropdown text colour
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ))
                                        .toList(),
                                    value: selectedValue2,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedValue2 = value as String;
                                      });
                                    },
                                    buttonHeight: 40,
                                    buttonWidth: 220,
                                    buttonPadding: const EdgeInsets.only(
                                        left: 14, right: 14),
                                    buttonDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          0), //Botton border radius
                                      border: Border.all(
                                        color: Color.fromARGB(255, 28, 28,
                                            28), //Button border colour
                                        width: 0.8, //Button border stroke
                                      ),
                                      color: Color.fromARGB(255, 255, 255,
                                          255), //Button background colour
                                    ),
                                    // buttonElevation: 2,
                                    itemHeight: 40, //line heights of list
                                    itemPadding: const EdgeInsets.only(
                                        left: 14, right: 14),
                                    dropdownMaxHeight: 200,
                                    dropdownWidth: 220,
                                    dropdownPadding: null,
                                    dropdownDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          5), //Dropdown border radius
                                      color: Color.fromARGB(255, 255, 255,
                                          255), //Dropdown background colour
                                    ),
                                    dropdownElevation: 8,
                                    scrollbarRadius: const Radius.circular(40),
                                    scrollbarThickness: 6,
                                    scrollbarAlwaysShow: true,
                                    offset: const Offset(0,
                                        -5), //Offset from the button and dropdown list
                                  ),
                                )),
                          ]))),
                ]))));
  }

  //Widget for uploading images //neww
  Widget _ImageView(imgPath) {
    if (imgPath == null) {
      return Center(
        child: Text("Add"),
      );
    } else {
      return Image.file(
        File(imgPath.path),
        fit: BoxFit.cover,
      );
    }
  }

  Future<File?> _takePhoto() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 300,
      maxHeight: 300,
    );
    print("Select a Picture!! Select a Picture!!:  " + image!.path);
    // final File? _imgPath = File(image!.path);

    setState(() {
      _imgPath = image;
      print(_imgPath);
    });
  }

  Future<File?> _openGallery() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 300,
      maxHeight: 300,
    );
    print("Select a Picture!! Select a Picture!!:  " + image!.path);
    // final File? _imgPath = File(image!.path);

    setState(() {
      _imgPath = image;
      // File _imgPath = File(image.path);
      print(_imgPath);
    });
  }
}
