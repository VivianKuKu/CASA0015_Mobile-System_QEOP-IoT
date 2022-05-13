import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'map.dart';
import 'data.dart';
import 'create.dart';
import 'log.dart';
import 'profile.dart';
import 'show_log.dart';

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
    MapPage(),
    DataPage(),
    CreatePage(),
    // LogPage(Colors.blue),
    // LogPage(),
    ShowLogPage(),
    // ProfilePage(Colors.yellow),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  //// Using Scaffold's bottomNavigationBar ////
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     bottomNavigationBar: BottomNavigationBar(
  //       items: const <BottomNavigationBarItem>[
  //         BottomNavigationBarItem(
  //           icon: Icon(Icons.map_outlined),
  //           label: 'Map',
  //         ),
  //         BottomNavigationBarItem(
  //           icon: Icon(Icons.insert_chart_outlined_rounded),
  //           label: 'Data',
  //         ),
  //         BottomNavigationBarItem(
  //           icon: Icon(Icons.school),
  //           label: 'Create',
  //         ),
  //         BottomNavigationBarItem(
  //           icon: Icon(Icons.library_books_outlined),
  //           label: 'Log',
  //         ),
  //         BottomNavigationBarItem(
  //           icon: Icon(Icons.people_alt_outlined),
  //           label: 'Profile',
  //         ),
  //       ],
  //       currentIndex: _selectedIndex,
  //       selectedItemColor: Color.fromARGB(255, 0, 0, 0),
  //       unselectedItemColor: Color.fromARGB(255, 174, 174, 174),
  //       onTap: _onItemTapped,
  //       type: BottomNavigationBarType.fixed,
  //     ),
  //     body: _children[_selectedIndex],
  //     //neww
  //     // body: CustomNavigator(
  //     //   navigatorKey: navigatorKey,
  //     //   home: _children[_selectedIndex],
  //     //   pageRoute: PageRoutes.materialPageRoute,
  //     // ),
  //   );
  // }

  //// Using CupertinoTabBar ////
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        height: 60,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined, size: 32.0),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insert_chart_outlined_rounded, size: 32.0),
            label: 'Data',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle, size: 58.0),
            // label: 'Create',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books_outlined, size: 32.0),
            label: 'Log',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_alt_outlined, size: 32.0),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        activeColor: Color.fromARGB(255, 0, 0, 0),
        inactiveColor: Color.fromARGB(255, 174, 174, 174),
        onTap: _onItemTapped,
        // type: BottomNavigationBarType.fixed,
      ),
      // body: _children[_selectedIndex],
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) {
            return _children[_selectedIndex];
          },
        );
      },
    );
  }
}
