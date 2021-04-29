// ignore: unused_import
import 'package:firebase_core/firebase_core.dart';
import 'package:project1/type/carservice.dart';
import 'package:project1/tab/mappage.dart';
import 'package:project1/tab/profile.dart';
import 'package:flutter/material.dart';

main() {
  runApp(MyMap());
}

class MyMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(
          uid: null,
          name: '',
        ),
        theme: ThemeData(fontFamily: 'Prompt'));
  }
}

class HomePage extends StatefulWidget {
  final int uid;
  final String name;
  HomePage({Key key, this.uid, this.name}) : super(key: key);
  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _selectedTab = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> tabs = <Widget>[
    //ยังใช้ กูเกิ้ลเม็บไม่ได้เครื่ืองไหนใช้ได้ ให้ใช้เมธอดนี้
    mappage(),
    //ถ้าใช้เมธอดด้านบนให้ลบ textด้านล่างออก
    //Text('map'),
    service(),
    profilepage()
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext conmaptext) {
    // ignore: unused_element
    return Scaffold(
      body: Center(child: tabs.elementAt(_selectedTab)),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
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
        currentIndex: _selectedTab,
        onTap: _onItemTapped,
        selectedItemColor: Colors.amber[800],
      ),
    );
  }
}

// ignore: camel_case_types
class profilepage extends StatelessWidget {
  final int uid;
  final String name;
  const profilepage({Key key, this.uid, this.name}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Profile(
      uid: uid,
      name: name,
    );
  }
}

// ignore: camel_case_types
class mappage extends StatelessWidget {
  const mappage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Map();
  }
}

// ignore: camel_case_types
class service extends StatelessWidget {
  const service({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Servicetype();
  }
}
