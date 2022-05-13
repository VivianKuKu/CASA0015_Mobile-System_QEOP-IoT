import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage();

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // List<Container> data;
  // _ProfilePageState({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void btnClickEvent() {
      print('btnClickEvent!!!!!...');
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('Profile', style: TextStyle(color: Colors.black)),
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
            child: Container(
                width: 375,
                height: 812,
                child: Stack(children: <Widget>[
                  ////Profile Photo////
                  Positioned(
                      top: 120,
                      left: 123,
                      child: Container(
                          width: 126,
                          height: 126,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color.fromRGBO(146, 146, 146, 1),
                              width: 1,
                            ),
                            image: DecorationImage(
                                image: AssetImage('assets/images/profile.jpg'),
                                fit: BoxFit.fitWidth),
                            borderRadius:
                                BorderRadius.all(Radius.elliptical(126, 126)),
                          ))),
                  ////Name////
                  Positioned(
                      top: 320,
                      left: 106,
                      child: Text(
                        'Vivian Ku',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontFamily: 'Comfortaa',
                            fontSize: 36,
                            letterSpacing:
                                0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1),
                      )),
                  ////Location////
                  Positioned(
                      top: 370,
                      left: 112,
                      child: Text(
                        'London, United kingdom',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontFamily: 'Roboto',
                            fontSize: 13,
                            letterSpacing:
                                0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1),
                      )),
                  ////EDIT Button////
                  Positioned(
                      top: 470,
                      left: 70,
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
                          child: Text("EDIT",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  fontFamily: 'Comfortaa',
                                  fontWeight: FontWeight.normal,
                                  height: 1)),
                        ),
                      )),
                ]))));
  }
}
