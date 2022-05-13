import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class DataPage extends StatefulWidget {
  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Data Feed', style: TextStyle(color: Colors.black)),
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
        body: MyListView());
  }
}

class MyListView extends StatefulWidget {
  @override
  ListViewState createState() => ListViewState();
}

class ListViewState extends State<MyListView> {
  late List<Widget> feeds;
  late var mqtt_inHumidity; //neww (must have 'late')
  late var mqtt_inTemp_C;
  late var mqtt_windSpeed_kph;
  late var mqtt_UV;
  String? mqtt_dayRain_cm;
  var mqtt_monthRain_cm;

  // String? s; //neww
  // late List<Widget> _list; //new
  // late String _list; //new

  @override
  void initState() {
    super.initState();
    feeds = [];
    // mqtt_data = '123'; //neww
    mqtt_inHumidity = 'Loading...'; //neww must have
    mqtt_inTemp_C = 'Loading...'; //neww must have
    mqtt_windSpeed_kph = 'Loading...';
    mqtt_UV = 'Loading...';
    mqtt_dayRain_cm = 'Loading...';
    mqtt_monthRain_cm = 'Loading...';
    startMQTT();
    // s = mqtt_data; //neww
    // _list = <Widget>[ListTile(subtitle: Text(mqtt_data))]; //neww
  }

  //new must have 'late'
  // late List<Widget> mqtt_list = <Widget>[
  //   ListTile(
  //     title: Text(
  //       'WST: inTemp_C',
  //       style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.0),
  //     ),
  //     subtitle: Text(
  //       mqtt_inTemp_C,
  //       style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0),
  //     ),
  //     leading: Icon(
  //       Icons.park,
  //       color: Color.fromARGB(255, 90, 90, 90),
  //     ),
  //   ),
  //   ListTile(
  //     title: Text(
  //       'WST: inHumidity',
  //       style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.0),
  //     ),
  //     subtitle: Text(mqtt_inHumidity,
  //         style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0)),
  //     leading: Icon(
  //       Icons.park,
  //       color: Color.fromARGB(255, 90, 90, 90),
  //     ),
  //   ),
  //   ListTile(
  //     title: Text(
  //       'WST: windSpeed_kph',
  //       style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.0),
  //     ),
  //     subtitle: Text(mqtt_windSpeed_kph,
  //         style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0)),
  //     leading: Icon(
  //       Icons.park,
  //       color: Color.fromARGB(255, 90, 90, 90),
  //     ),
  //   ),
  //   ListTile(
  //     title: Text(
  //       'WST: UV',
  //       style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.0),
  //     ),
  //     subtitle: Text(mqtt_UV,
  //         style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0)),
  //     leading: Icon(
  //       Icons.park,
  //       color: Color.fromARGB(255, 90, 90, 90),
  //     ),
  //   ),
  //   ListTile(
  //     title: Text(
  //       'WST: dayRain_cm',
  //       style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.0),
  //     ),
  //     subtitle: Text('$mqtt_dayRain_cm',
  //         style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0)),
  //     leading: Icon(Icons.park, color: Color.fromARGB(255, 90, 90, 90)),
  //   ),
  //   ListTile(
  //     title: Text(
  //       'WST: monthRain_cm',
  //       style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.0),
  //     ),
  //     subtitle: Text(mqtt_monthRain_cm,
  //         style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0)),
  //     leading: Icon(
  //       Icons.park,
  //       color: Color.fromARGB(255, 90, 90, 90),
  //     ),
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    // return ListView.builder(
    //   itemCount: feeds.length,
    //   itemBuilder: (context, index) {
    //     return ListTile(
    //       title: feeds[index],
    //     );
    //   },
    // );

    //neww

    // return Center(
    //   //列表元件
    //   child: ListView(
    //     children: mqtt_list, //new
    //   ),
    // );

    // return Center(
    //   child: Column(children: <Widget>[
    //     Text('HELLO'),
    //     Text(mqtt_inHumidity),
    //     Text(mqtt_inTemp_C)
    //   ]),
    // );

    return Center(
      child: Column(children: <Widget>[
        Text(''),
        Container(
          width: 380,
          height: 70,
          child: Text('inHumidity: $mqtt_inHumidity',
              style: TextStyle(
                  fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0)),
          margin: EdgeInsets.only(left: 20, top: 15, right: 20, bottom: 5),
          padding: EdgeInsets.only(left: 15, top: 22),
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
        ),
        Container(
          width: 380,
          height: 70,
          child: Text('inTemp_C: $mqtt_inTemp_C',
              style: TextStyle(
                  fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0)),
          margin: EdgeInsets.only(left: 20, top: 15, right: 20, bottom: 5),
          padding: EdgeInsets.only(left: 15, top: 22),
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
        ),
        Container(
          width: 380,
          height: 70,
          child: Text('windSpeed_kph: $mqtt_windSpeed_kph',
              style: TextStyle(
                  fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0)),
          margin: EdgeInsets.only(left: 20, top: 15, right: 20, bottom: 5),
          padding: EdgeInsets.only(left: 15, top: 22),
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
        ),
        Container(
          width: 380,
          height: 70,
          child: Text('UV: $mqtt_UV',
              style: TextStyle(
                  fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0)),
          margin: EdgeInsets.only(left: 20, top: 15, right: 20, bottom: 5),
          padding: EdgeInsets.only(left: 15, top: 22),
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
        ),
        Container(
          width: 380,
          height: 70,
          child: Text('dayRain_cm: $mqtt_dayRain_cm',
              style: TextStyle(
                  fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0)),
          margin: EdgeInsets.only(left: 20, top: 15, right: 20, bottom: 5),
          padding: EdgeInsets.only(left: 15, top: 22),
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
        ),
        Container(
          width: 380,
          height: 70,
          child: Text('monthRain_cm: $mqtt_monthRain_cm',
              style: TextStyle(
                  fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0)),
          margin: EdgeInsets.only(left: 20, top: 15, right: 20, bottom: 5),
          padding: EdgeInsets.only(left: 15, top: 22),
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
        ),
      ]),
    );
  }

  updateList(String s, int b) {
    setState(() {
      // feeds.add(Text(s));
      if (b == 1) {
        mqtt_inHumidity = s;
        print('mqtt_inHumidity= '); //neww
        print(s); //neww
        print(mqtt_inHumidity);
      }
      if (b == 2) {
        mqtt_inTemp_C = s;
        print('mqtt_inTemp_C= '); //neww
        print(s); //neww
      }
      if (b == 3) {
        mqtt_windSpeed_kph = s;
        print('mqtt_windSpeed_kph= '); //neww
        print(s); //neww
      }
      if (b == 4) {
        mqtt_UV = s;
        print('mqtt_UV= '); //neww
        print(s); //neww
      }
      if (b == 5) {
        mqtt_dayRain_cm = s;
        print('mqtt_dayRain_cm= '); //neww
        print(s); //neww
      }
      if (b == 6) {
        mqtt_monthRain_cm = s;
        print('mqtt_monthRain_cm= '); //neww
        print(s); //neww
      }
    });
  }

  Future<void> startMQTT() async {
    final client = MqttServerClient('mqtt.cetools.org',
        'vivian-ku-client'); //broker.hivemq.com  mqtt://mqtt.cetools.org
    client.port = 1883; // 1883   1884

    // Set the correct MQTT protocol for mosquito
    client.setProtocolV311();

    // If you intend to use a keep alive you must set it here otherwise keep alive will be disabled.
    client.keepAlivePeriod = 30; // 30   60

    final String username = ''; // 'username'
    final String password = ''; // 'password'

    // Connect the client, any errors here are communicated by raising of the appropriate exception.
    try {
      await client.connect(username, password);
    } catch (e) {
      print('client exception - $e');
      client.disconnect();
    }

    // Check we are connected
    if (client.connectionStatus!.state == MqttConnectionState.connected) {
      print('Mosquitto client connected');
    } else {
      print(
          'ERROR Mosquitto client connection failed - disconnecting, state is ${client.connectionStatus!.state}');
      client.disconnect();
    }

    // Ok, lets try a subscription or two, note these may change/cease to exist on the broker
    // const topic_1 =
    //     'UCL/PSW/Garden/WST/dvp2/inHumidity'; //SCD41-CO2-1   UCL/PSW/Garden/WST/dvp2
    // client.subscribe(topic_1, MqttQos.atMostOnce);
    const topic_2 =
        'UCL/PSW/Garden/WST/dvp2/inTemp_C'; //SCD41-CO2-1   UCL/PSW/Garden/WST/dvp2
    client.subscribe(topic_2, MqttQos.atMostOnce);
    const topic_1 =
        'UCL/PSW/Garden/WST/dvp2/inHumidity'; //SCD41-CO2-1   UCL/PSW/Garden/WST/dvp2
    client.subscribe(topic_1, MqttQos.atMostOnce);
    const topic_3 =
        'UCL/PSW/Garden/WST/dvp2/windSpeed_kph'; //SCD41-CO2-1   UCL/PSW/Garden/WST/dvp2
    client.subscribe(topic_3, MqttQos.atMostOnce);
    const topic_4 =
        'UCL/PSW/Garden/WST/dvp2/UV'; //SCD41-CO2-1   UCL/PSW/Garden/WST/dvp2
    client.subscribe(topic_4, MqttQos.atMostOnce);
    const topic_5 =
        'UCL/PSW/Garden/WST/dvp2/dayRain_cm'; //SCD41-CO2-1   UCL/PSW/Garden/WST/dvp2
    client.subscribe(topic_5, MqttQos.atMostOnce);
    const topic_6 =
        'UCL/PSW/Garden/WST/dvp2/monthRain_cm'; //SCD41-CO2-1   UCL/PSW/Garden/WST/dvp2
    client.subscribe(topic_6, MqttQos.atMostOnce);

    // The client has a change notifier object(see the Observable class) which we then listen to to get
    // notifications of published updates to each subscribed topic.
    client.updates!.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
      final receivedMessage = c![0].payload as MqttPublishMessage;
      final messageString = MqttPublishPayload.bytesToStringAsString(
          receivedMessage.payload.message);

      // if(){}

      /// The payload is a byte buffer, this will be specific to the topic
      print(
          'Change notification:: topic is <${c[0].topic}>, payload is <-- $messageString -->');
      print('');
      print('TEST= ');
      print(c[0].topic);
      print(c[0]);
      print(c[0].topic);
      print('messageString= $messageString');
      print(messageString);
      // print('Topic_1= $topic_1');
      // print('Topic_2= $topic_2');

      if (c[0].topic == topic_1) {
        print('this is topic 1');
        updateList(messageString, 1);
      } else if (c[0].topic == topic_2) {
        print('this is topic 2');
        updateList(messageString, 2);
      } else if (c[0].topic == topic_3) {
        print('this is topic 3');
        updateList(messageString, 3);
      } else if (c[0].topic == topic_4) {
        print('this is topic 4');
        updateList(messageString, 4);
      } else if (c[0].topic == topic_5) {
        print('this is topic 5');
        updateList(messageString, 5);
      } else if (c[0].topic == topic_6) {
        print('this is topic 6');
        updateList(messageString, 6);
      } else {
        print('this is nothing.');
      }
      ;
    });
  }
}
