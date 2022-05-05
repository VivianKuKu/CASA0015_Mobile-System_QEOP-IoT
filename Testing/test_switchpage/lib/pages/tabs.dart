import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'map.dart';
import 'data.dart';
import 'create.dart';
import 'log.dart';
import 'profile.dart';

class Tabs extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TabsState();
  }
}

class _TabsState extends State<Tabs> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  List<Widget> _children = [
    //static const List<Widget> _children
    MapPage(),
    DataPage(),
    CreatePage(),
    LogPage(Colors.blue),
    ProfilePage(Colors.yellow),
  ];
  // <Widget>[
  //   // Text(
  //   //   'Index 0: Map',
  //   //   style: optionStyle,
  //   // ),
  //   // Text(
  //   //   'Index 1: Data',
  //   //   style: optionStyle,
  //   // ),
  //   // Text(
  //   //   'Index 2: Create Log',
  //   //   style: optionStyle,
  //   // ),
  //   // Text(
  //   //   'Index 3: Log',
  //   //   style: optionStyle,
  //   // ),
  //   // Text(
  //   //   'Index 4: Profile',
  //   //   style: optionStyle,
  //   // ),
  // ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('IoT Devices @ QEOP', style: TextStyle(color: Colors.black)),
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
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insert_chart_outlined_rounded),
            label: 'Data',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Create',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books_outlined),
            label: 'Log',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_alt_outlined),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
      body: _children[_selectedIndex],
    );
  }
}
