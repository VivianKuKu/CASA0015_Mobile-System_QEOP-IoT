import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'MyChangeNotifier.dart';

// USING LIST ＋ CARD!!
// https://clay-atlas.com/blog/2019/12/22/flutter-chinese-tutorial-listview-components/

class ShowLogPage extends StatelessWidget {
  // ShowLogPage(List<Map<String, dynamic>> products);

  // int? intVal;
  // // String? strProjectID;
  // String? strDeviceID;
  // String? strDate;
  // String? strTime;
  // List? listProductList;

  // ShowLogPage(List<Map<String, dynamic>> products,
  //     {Key? key,
  //     this.intVal,
  //     // this.strProjectID,
  //     this.strDeviceID,
  //     this.strDate,
  //     this.strTime,
  //     this.listProductList})
  //     : super(key: key);

  // final List products; //neww
  // ShowLogPage(this.products); //neww
  // ShowLogPage({Key? key, this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final getData = Provider.of<MyChangeNotifier>(context); //neww
    print('PRINT= ');
    print(getData.logs); //123

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
        body: SingleChildScrollView(child: Center(
          // child: Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: <Widget>[
          //       // Text('intVal: $intVal'),
          //       // // Text('Project ID: $strProjectID'),
          //       // Text('Device ID: $strDeviceID'),
          //       // Text('Date: $strDate'),
          //       // Text('Time: $strTime'),
          //       // Text('Map: $listProductList'),
          //       // Text('Result-ProjectID: ${getdata.selectedValue}'), //neww
          //       Text('Result: $getdata.products') //neww
          //     ]),
          //
          //new
          child: Consumer<MyChangeNotifier>(
            builder: (context, getdata, _) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: getdata.containerList,
              );
            },
          ),
        )));
  }
}
