import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'map_location.dart';
import 'dart:async';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();

  // const MapPage({Key? key}) : super(key: key);
}

class _MapPageState extends State<MapPage> {
  // late GoogleMapController mapController;

  final LatLng _center =
      const LatLng(51.540992, -0.015719); //initial target (location)

  // Solution 1
  // Map<MarkerId, Marker> markers = <MarkerId, Marker>{}; //new

  // void _onMapCreated(GoogleMapController controller) {
  //   mapController = controller;

  //new (start)
  // final marker = Marker(
  //   markerId: MarkerId('place_name'),
  //   position: LatLng(51.540992, -0.015719),
  //   // icon: BitmapDescriptor.,
  //   infoWindow: InfoWindow(
  //     title: 'title',
  //     snippet: 'address',
  //   ),
  // );

  // setState(() {
  //   markers[MarkerId('place_name')] = marker;
  // });
  //new (end)
  // }

  //Solution 2
  Completer<GoogleMapController> _controller = Completer();
  Iterable markers = [];
  Iterable _markers = Iterable.generate(map_location.list.length, (index) {
    return Marker(
        markerId: MarkerId(map_location.list[index]['id']),
        position: LatLng(
          map_location.list[index]['lat'],
          map_location.list[index]['lon'],
        ),
        infoWindow: InfoWindow(title: map_location.list[index]["title"]));
  });

  @override
  void initState() {
    setState(() {
      markers = _markers;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
        body: GoogleMap(
          // onMapCreated: _onMapCreated,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 15.0,
          ),
          // markers: markers.values.toSet(), //new
          markers: Set.from(markers),
        ),
      ),
    );
  }
}
