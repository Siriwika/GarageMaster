import 'dart:async';
import 'package:Project1/widget/category.dart';
import 'package:Project1/widget/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

void main() => runApp(MyMap());

class MyMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: HomePage(), theme: ThemeData(fontFamily: 'Prompt'));
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    var tabs = [
      Mappage(),
      Category(),
      Profile(),
    ];

    return Scaffold(
      body: tabs[_selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: (int index) {
          setState(() {
            _selectedTab = index;
          });
        },
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: ("หน้าหลัก"),
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.electric_car_outlined),
            label: ("ประเภท"),
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: ("โปรไฟล์"),
          ),
        ],
      ),
    );
  }
}

class Mappage extends StatefulWidget {
  @override
  _MappageState createState() => _MappageState();
}

class _MappageState extends State<Mappage> {
  Completer<GoogleMapController> _controller = Completer();
  LocationData currentLocation;
  static final CameraPosition bangkok = CameraPosition(
    target: LatLng(13.7674109, 100.5288173),
    zoom: 14.0 - 2.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        myLocationEnabled: true,
        initialCameraPosition: bangkok,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: {
          Marker(
            markerId: MarkerId("1"),
            position: LatLng(13.9230668, 100.4942573),
            infoWindow: InfoWindow(
                title: "อู่ซ่อมสีรถยนต์ วิทูร เซอร์วิส",
                snippet: "บริการเคาะตัวถังรถยนต์"),
          ),
          Marker(
            markerId: MarkerId("2"),
            position: LatLng(13.9073195, 100.5138999),
            infoWindow: InfoWindow(
                title: "อู่ซ่อมรถแจ้งวัฒนะ 23",
                snippet: "ซ่อมรถยนต์และบำรุงรักษา"),
          ),
          Marker(
            markerId: MarkerId("3"),
            position: LatLng(13.9085084, 100.5135734),
            infoWindow: InfoWindow(
                title: "อู่ Christ Auto Shop", snippet: "ร้านซ่อมรถยนต์"),
          ),
          Marker(
            markerId: MarkerId("4"),
            position: LatLng(13.909561, 100.5142254),
            infoWindow: InfoWindow(
                title: "อู่ฮวดเจริญการช่าง โดยนายกิมใช้ แซ่ตั้ง",
                snippet: "ร้านซ่อมรถยนต์"),
          ),
          Marker(
            markerId: MarkerId("5"),
            position: LatLng(13.9336663, 100.5057297),
            infoWindow: InfoWindow(
                title: "อู่ถวิลเจริญยนต์", snippet: "ซ่อมรถยนต์และบำรุงรักษา"),
          ),
          Marker(
            markerId: MarkerId("6"),
            position: LatLng(13.9317934, 100.5051276),
            infoWindow: InfoWindow(
                title: "ห้างหุ้นส่วนจำกัด อู่คงเดชเจริญยนต์",
                snippet: "ร้านซ่อมรถยนต์"),
          ),
          Marker(
            markerId: MarkerId("7"),
            position: LatLng(13.9297737, 100.5059654),
            infoWindow: InfoWindow(
                title: "อู่ช่างโจ้ เซอร์วิส",
                snippet: "ซ่อมรถยนต์และบำรุงรักษา"),
          ),
          Marker(
            markerId: MarkerId("8"),
            position: LatLng(13.9263459, 100.51539),
            infoWindow:
                InfoWindow(title: "อู่เบนซ์ ช่างรา", snippet: "บริการรถยนต์"),
          ),
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToMe,
        label: Text('ตำแหน่งของฉัน'),
        icon: Icon(Icons.near_me),
      ),
    );
  }

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

  Future _goToMe() async {
    final GoogleMapController controller = await _controller.future;
    currentLocation = await getCurrentLocation();
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(currentLocation.latitude, currentLocation.longitude),
      zoom: 16.0 - 2.0,
    )));
  }
}
