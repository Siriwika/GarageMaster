import 'dart:async';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:project1/Models/TestModel.dart';
import 'package:project1/addgarage/garage.dart';

class Mappage extends StatefulWidget {
  @override
  _MappageState createState() => _MappageState();
}

class Map extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Mappage(),
        theme: ThemeData(fontFamily: 'Prompt')
        );
  }
}

class _MappageState extends State<Mappage> {
  Future<List<GarageModel>> futureGarage;
  List<GarageModel> markervalue;
  Set<Marker> markers= HashSet<Marker>();
  List<Marker> allMarkers = [];
  GoogleMapController _controller;
  bool isMapCreated = false;
  LocationData currentLocation;
  static final CameraPosition bangkok = CameraPosition(
    target: LatLng(13.8600204, 100.5408732),
    zoom: 14.0 - 2.0,
  );

  Future<LocationData> getCurrentLocation() async {
    Location location = Location();
    try {
      return await location.getLocation();
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        // Permission denied
      }
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
    futureGarage = fetchGarageDetail();
    //_setMarkerIcon();
  }

  void _onMapCreated(GoogleMapController controller) async {
    //call api
    //map json
    _controller = controller;

    setState(() {
      for (int i = 0; i < markervalue.length; i++) {
        markers.add(
          Marker(
              markerId: MarkerId(markervalue[i].gId.toString()),
              position: LatLng(markervalue[i].gLatitude, markervalue[i].gLongitude),
              infoWindow: InfoWindow(
                  title: markervalue[i].gName,
                  snippet: markervalue[i].gDescription),
                  onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GaragePage()));
                  }
            ),
        );
      }
    });
  }

  Future _goToMe() async {
    final GoogleMapController controller = await _controller;
    currentLocation = await getCurrentLocation();
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(currentLocation.latitude, currentLocation.longitude),
      zoom: 16.0 - 2.0,
    )));
  }

  Future<String> getJsonFile(String path) async {
    return await rootBundle.loadString(path);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: FutureBuilder<List<GarageModel>>(     
          future: futureGarage,
          builder: (context, marker) {
            if (marker.hasData) {
              markervalue = marker.data;
              return GoogleMap(
                  mapType: MapType.normal,
                  myLocationEnabled: true,
                  initialCameraPosition: bangkok,
                  onMapCreated: _onMapCreated,
                  markers: markers);
            } else if (marker.hasError) {
              return Text(marker.error);
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToMe,
        label: Text('ตำแหน่งของฉัน'),
        icon: Icon(Icons.near_me),
      ),
    );
  }
}
