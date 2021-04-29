import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:project1/addgarage/addstep3.dart';
import 'package:project1/utility/dialog.dart';

// main() {
//   runApp(Garage2());
// }

class Garage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Garage Master",
        home: MyGarage2(
          gdescription: '',
          gName: '',
          image: null,
          uid:null,
        ),
        theme: ThemeData(fontFamily: 'Prompt'));
  }
}

// ignore: must_be_immutable
class MyGarage2 extends StatefulWidget {
  String gName;
  String gdescription;
  File image;
  int uid;

  MyGarage2(
      {Key key,
      this.title,
      this.uid,
      @required this.gName,
      this.gdescription,
      @required this.image})
      : super(key: key);
  final String title;

  @override
  _MyGaragePage2 createState() => _MyGaragePage2();
}

class _MyGaragePage2 extends State<MyGarage2> {
  List<DropdownMenuItem<String>> listDrop = [];
  double screen;
  // String got;
  // String gct;
  TimeOfDay gOpenT;
  TimeOfDay gCloseT;
  double lat, long;
  String gphone;
  String _gServiceType;
  CameraPosition position;
  String _gDate;
  int _gCharge;

  final gphonecontroller = TextEditingController();
  final gc = TextEditingController();
  @override
  void initState() {
    super.initState();
    gOpenT = TimeOfDay.now();
    gCloseT = TimeOfDay.now();
    findLatLong();
  }

  Future<Null> findLatLong() async {
    LocationData locationdata = await findlocation();
    setState(() {
      lat = locationdata.latitude;
      long = locationdata.longitude;
      //post api ตรงนี้ได้
      print('latitude = $lat ,longitude = $long');
    });
  }

  Future<LocationData> findlocation() async {
    Location location = Location();
    try {
      return await location.getLocation();
    } catch (e) {
      return null;
    }
  }

  // void loadDatagDate() {
  //   listDrop = [];
  //   listDrop.add(DropdownMenuItem(
  //     child: Text('ทุกวัน'),
  //     value: "ทุกวัน",
  //   ));
  //   listDrop.add(DropdownMenuItem(
  //     child: Text('จ-ศ'),
  //     value: "จ-ศ",
  //   ));
  // }

  // void loadDatagService() {
  //   listDrop = [];
  //   listDrop.add(DropdownMenuItem(
  //     child: Text('ไปหาถึงที่ได้'),
  //     value: "ไปหาถึงที่ได้",
  //   ));
  //   listDrop.add(DropdownMenuItem(
  //     child: Text('เฉพาะที่อู่เท่านั้น'),
  //     value: "เฉพาะที่อู่เท่านั้น",
  //   ));
  // }

  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    print('screen = $screen');
    // loadDatagDate();
    // loadDatagService();
    return Scaffold(
        backgroundColor: Color.fromRGBO(239, 113, 40, 1),
        body: SafeArea(
            child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(15.0),
                child: Column(children: <Widget>[
                  SizedBox(
                    height: screen * 0.15,
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: screen * 0.3,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: text('เบอร์โทร')),
                        ),
                      ),
                      SizedBox(
                        width: screen * 0.6,
                        child: Container(
                          height: screen * 0.13,
                          decoration: bgInput(),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6, top: 18),
                            child: Center(
                              child: TextField(
                                controller: gphonecontroller,
                                onChanged: (value) => gphone = value.trim(),
                                keyboardType: TextInputType.phone,
                                textInputAction: TextInputAction.next,
                                decoration: textborderside('08XXXXXXXX'),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: screen * 0.02,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: screen * 0.3,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: text('เวลาทำการ')),
                        ),
                      ),
                      SizedBox(
                        width: screen * 0.2,
                        child: Container(
                          decoration: bgInput(),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: DropdownButton(
                                value: _gDate,
                                items: [
                                  DropdownMenuItem(
                                    child: Text("ทุกวัน"),
                                    value: "ทุกวัน",
                                  ),
                                  DropdownMenuItem(
                                    child: Text("จ.- ศ."),
                                    value: "จ.- ศ.",
                                  )
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    _gDate = value;
                                    print(_gDate);
                                  });
                                }),
                          ),
                        ),
                      ),
                    ],
                  ),
                  ListTile(
                    title: Text(
                      'ตั้งแต่: ${gOpenT.hour}:${gOpenT.minute}น.',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    trailing: Icon(Icons.keyboard_arrow_down),
                    onTap: _pickTime,
                  ),
                  ListTile(
                    title: Text(
                      'ถึง: ${gCloseT.hour}:${gCloseT.minute}น.',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    trailing: Icon(Icons.keyboard_arrow_down),
                    onTap: _pickTime2,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: text('ที่ตั้ง (ตำแหน่งปัจุจบัน)  ')),
                  addGLocation(),
                  //แสดงแผนที่เอาค่าที่อยู่ร้าน
                  SizedBox(
                    height: screen * 0.02,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: screen * 0.4,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: text('ค่าบริการเริ่มต้น')),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: screen * 0.13,
                          decoration: bgInput(),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6, top: 18),
                            child: Center(
                              child: TextField(
                                controller: gc,
                                onChanged: (value) {
                                  setState(() {
                                    _gCharge = int.parse(value);
                                    print(_gCharge);
                                  });
                                },
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.done,
                                decoration: textborderside(''),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                          width: screen * 0.25,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: text('บาท')),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: screen * 0.05,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: screen * 0.4,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: text('รูปแบบบริการ')),
                        ),
                      ),
                      SizedBox(
                        width: screen * 0.36,
                        child: Container(
                          decoration: bgInput(),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: DropdownButton(
                                value: _gServiceType,
                                items: [
                                  DropdownMenuItem(
                                    child: Text("เฉพาะที่อู่เท่านั้น"),
                                    value: "เฉพาะที่อู่เท่านั้น",
                                  ),
                                  DropdownMenuItem(
                                    child: Text("ไปหาถึงที่ได้"),
                                    value: "ไปหาถึงที่ได้",
                                  )
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    _gServiceType = value;
                                    print(_gServiceType);
                                  });
                                }),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screen * 0.1,
                  ),
                  Container(
                    child: Center(
                        child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      color: Colors.green,
                      child: Text('ต่อไป',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          )),
                      onPressed: () {
                        print(lat.toDouble());
                        print(long);
                        if ((gphone?.isEmpty ?? true) ||
                            (_gDate?.isEmpty ?? true) ||
                            (gOpenT == null) ||
                            (gCloseT == null) ||
                            (_gCharge == null) ||
                            (_gServiceType?.isEmpty ?? true)) {
                          normalDialog(context, "คุณยังไม่ได้กรอกข้อมูล",
                              "กรุณากรอกข้อมูลให้ครบ");
                        } else if (gphone.length != 10) {
                          normalDialog(context, "เบอร์โทรไม่ครบ 10 หลัก",
                              "กรุณากรอกเบอร์โทรให้ครบ 10 หลัก");
                        } else {
                          final localizations =
                              MaterialLocalizations.of(context);
                          final gO = localizations.formatTimeOfDay(gOpenT);
                          final gT = localizations.formatTimeOfDay(gCloseT);
                          print(gO + gT);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyGarage3(
                                        gdescription: widget.gdescription,
                                        gCharge: gc.text,
                                        gCloseT: gO,
                                        gDate: _gDate.toString(),
                                        gName: widget.gName,
                                        gOpenT: gT,
                                        gphone: gphonecontroller.text,
                                        gServiceType: _gServiceType.toString(),
                                        image: widget.image,
                                        lat: lat.toString(),
                                        long: long.toString(),
                                        uid: widget.uid,
                                      )));
                        }
                      },
                    )),
                  )
                ]),
              ),
            ),
          ],
        )));
  }

  Container addGLocation() {
    if (lat != null) {
      LatLng latLng = LatLng(lat, long);
      position = CameraPosition(target: latLng, zoom: 16.0);
    }

    Marker userMarker() {
      return Marker(
        markerId: MarkerId('userMarker'),
        position: LatLng(lat, long),
        icon: BitmapDescriptor.defaultMarkerWithHue(20.0),
        infoWindow: InfoWindow(title: 'คุณอยู่ตรงนี้'),
      );
    }

    Set<Marker> mySet() {
      return <Marker>[userMarker()].toSet();
    }

    return Container(
      height: screen * 0.8,
      color: Colors.grey,
      margin: EdgeInsets.all(5),
      child: lat == null
          ? Center(child: CircularProgressIndicator())
          : GoogleMap(
              initialCameraPosition: position,
              mapType: MapType.normal,
              onMapCreated: (controller) {},
              markers: mySet(),
            ),
    );
  }

  _pickTime() async {
    TimeOfDay t;
    t = await showTimePicker(context: context, initialTime: gOpenT);
    if (t != null)
      setState(() {
        gOpenT = t;
        // got = '${t.hour}:${t.minute}';
        // print(got);
      });
  }

  _pickTime2() async {
    TimeOfDay t2;
    t2 = await showTimePicker(context: context, initialTime: gCloseT);

    if (t2 != null)
      setState(() {
        gCloseT = t2;
        // gct = '${t2.hour}:${t2.minute}';
        // print(gct);
      });
  }

  BoxDecoration bgInput() {
    return BoxDecoration(
      color: Colors.white,
      border: Border.all(width: 0, color: Colors.white),
      borderRadius: const BorderRadius.all(const Radius.circular(15)),
    );
  }

  InputDecoration textborderside(String hint) {
    return InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(borderSide: BorderSide.none));
  }

  Text text(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 20),
    );
  }
}

