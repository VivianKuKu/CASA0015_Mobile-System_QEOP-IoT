import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

// Tutorial: https://docs.flutter.dev/cookbook/lists/mixed-list

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
  late var mqtt_data; //neww (must have 'late')
  // String? s; //neww
  late List<Widget> _list; //new
  // late String _list; //new

  @override
  void initState() {
    super.initState();
    feeds = [];
    // mqtt_data = '123'; //neww
    mqtt_data = '';
    startMQTT();
    // s = mqtt_data; //neww
    // _list = <Widget>[ListTile(subtitle: Text(mqtt_data))]; //neww
  }

  //new
  @override
  late List<Widget> mqtt_list = <Widget>[
    ListTile(
      title: Text(
        'WST: inTemp_C',
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.0),
      ),
      subtitle: Text('test content'),
      leading: Icon(
        Icons.event_seat,
        color: Colors.blue,
      ),
    ),
    ListTile(
      title: Text(
        'WST: inHumidity',
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.0),
      ),
      subtitle: Text(mqtt_data),
      leading: Icon(
        Icons.event_seat,
        color: Colors.blue,
      ),
    ),
    ListTile(
      title: Text(
        'WST: UV',
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.0),
      ),
      subtitle: Text('test content'),
      leading: Icon(
        Icons.event_seat,
        color: Colors.blue,
      ),
    ),
    ListTile(
      title: Text(
        'WST: windSpeed_kph',
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.0),
      ),
      subtitle: Text('test content'),
      leading: Icon(
        Icons.event_seat,
        color: Colors.blue,
      ),
    ),
  ];

  updateList(String? s) {
    setState(() {
      // feeds.add(Text(s));
      mqtt_data = s; //neww
      print('s= '); //neww
      print(s); //neww
      print(mqtt_data);
    });
  }

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

    return Center(
      //列表元件
      child: ListView(
        children: mqtt_list, //new
      ),
    );
  }

  Future<void> startMQTT() async {
    final client = MqttServerClient('mqtt.cetools.org',
        'vivian-client'); //broker.hivemq.com  mqtt://mqtt.cetools.org
    client.port = 1883; // 1883   1884

    // Set the correct MQTT protocol for mosquito
    client.setProtocolV311();

    // If you intend to use a keep alive you must set it here otherwise keep alive will be disabled.
    client.keepAlivePeriod = 30; // 30   60

    final String username = ''; // 'username'   'student'
    final String password = ''; // 'password'   'ce2021-mqtt-forget-whale'

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
    const topic =
        'UCL/PSW/Garden/WST/dvp2/inHumidity'; //SCD41-CO2-1   UCL/PSW/Garden/WST/dvp2
    client.subscribe(topic, MqttQos.atMostOnce);

    // The client has a change notifier object(see the Observable class) which we then listen to to get
    // notifications of published updates to each subscribed topic.
    client.updates!.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
      final receivedMessage = c![0].payload as MqttPublishMessage;
      final messageString = MqttPublishPayload.bytesToStringAsString(
          receivedMessage.payload.message);

      /// The payload is a byte buffer, this will be specific to the topic
      print(
          'Change notification:: topic is <${c[0].topic}>, payload is <-- $messageString -->');
      print('');

      updateList(messageString);
      // mqtt_data = messageString; //new
    });
  }
}
