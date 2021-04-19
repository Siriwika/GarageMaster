import 'dart:async';
import 'dart:collection';
import 'dart:math' as Math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:project1/Models/TestModel.dart';
import 'package:project1/addgarage/garage.dart';

class Mappage extends StatefulWidget {
  Mappage([Key key]) : super(key: key);
  @override
  _MappageState createState() => _MappageState();
}

class Map extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Mappage(),
        theme: ThemeData(fontFamily: 'Prompt'));
  }
}

class _MappageState extends State<Mappage> {
  
  Future<List<GarageModel>> futureGarage;
  List<GarageModel> markervalue;
  Set<Marker> markers = HashSet<Marker>();
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


  double _distance(double clat, double clon, double glat, double glon) {
    var R = 6371; // Radius of the earth in km
    var dLat = deg2rad(glat - clat); // deg2rad below
    var dLon = deg2rad(glon - clon);
    var a = Math.sin(dLat / 2) * Math.sin(dLat / 2) +
        Math.cos(deg2rad(clat)) *
            Math.cos(deg2rad(glat)) *
            Math.sin(dLon / 2) *
            Math.sin(dLon / 2);
    var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
    var d = R * c; // Distance in km
    return d;
  }

  double deg2rad(deg) {
    return deg * (Math.pi / 180);
  }

  void _onMapCreated(GoogleMapController controller) async {
    //call api
    //map json
    _controller = controller;
    currentLocation = await getCurrentLocation();

    setState(() {
      for (int i = 0; i < markervalue.length; i++) {

        double distKM = _distance(
            currentLocation.latitude,
            currentLocation.longitude,
            markervalue[i].gLatitude,
            markervalue[i].gLongitude);
    
        if (distKM <= 5) {
          markervalue[i].km = distKM;
          markers.add(
            Marker(
              markerId: MarkerId(markervalue[i].gId.toString()),
              position:
                  LatLng(markervalue[i].gLatitude, markervalue[i].gLongitude),
              infoWindow: InfoWindow(
                  title: markervalue[i].gName,
                  snippet: markervalue[i].gDescription,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Garage(markervalue[i])));
                  }),
            ),
          );
        }
      }
    });
  }

  Future _goToMe() async {
    final GoogleMapController controller = _controller;
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
