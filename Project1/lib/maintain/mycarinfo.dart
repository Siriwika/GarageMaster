import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project1/Models/CarinfoModel.dart';
import 'package:project1/maintain/carinfo.dart';
import 'package:intl/intl.dart';

class Detailcar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp (
    );
  }
}

class Detail extends StatefulWidget {
    final CarModel carModels;
  Detail(this.carModels);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {

    Future<String> getJsonFile(String path) async {
    return await rootBundle.loadString(path);
  }

  double screen;
  String engine;
  String battery;
  String coolant;
  String fuel;
  String aircondition;
  String powertrain;
  String breaking;
  String tires;
  String steering;
  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    engine = DateFormat('dd-MM-yyyy').format(widget.carModels.cEngine);
    battery = DateFormat('dd-MM-yyyy').format(widget.carModels.cBattery);
    coolant = DateFormat('dd-MM-yyyy').format(widget.carModels.cCoolant);
    fuel = DateFormat('dd-MM-yyyy').format(widget.carModels.cFuel);
    aircondition = DateFormat('dd-MM-yyyy').format(widget.carModels.cAirConditioning);
    powertrain = DateFormat('dd-MM-yyyy').format(widget.carModels.cPowerTrain);
    breaking = DateFormat('dd-MM-yyyy').format(widget.carModels.cBraking);
    tires = DateFormat('dd-MM-yyyy').format(widget.carModels.cTires);
    steering = DateFormat('dd-MM-yyyy').format(widget.carModels.cSteering);

    print('screen = $screen');
    return Scaffold(
        backgroundColor: Color.fromRGBO(239, 113, 40, 1),
        body: SafeArea(
            child: Expanded(
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: screen * 0.02,
                  ),
                  Image.network(widget.carModels.cImage,
                    height: screen * 0.3,
                    width: screen * 0.5,
                    fit: BoxFit.cover,
                  ),
                  Center(
                    child: Container(
                        margin: EdgeInsets.fromLTRB(5,5,5,5),
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                        alignment: Alignment.center,
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                'ยี่ห้อรถ',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              child: Text(widget.carModels.cBrand,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        )),
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        child: FlatButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CarInfo1()));
                          },
                          child: Text(
                            'อัพเดท',
                            style: TextStyle(
                                color: Colors.orange[100],
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                      child: Center(
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.orange[100]),
                        margin: EdgeInsets.all(20),
                        padding: EdgeInsets.all(20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            buildTextFieldEmail(),
                            buildTextFieldEngine(),
                            buildTextFieldBattery(),
                            buildTextFieldCoolant(),
                            buildTextFieldFuel(),
                            buildTextFieldAir(),
                            buildTextFieldPower(),
                            buildTextFieldbreking(),
                            buildTextFieldTires(),
                            buildTextFieldSteering(),
                            // buildButtonSignIn(context),
                          ],
                        )),
                  ))
                ]),
          ),
        )));
  }
  Container buildTextFieldEmail() {
    return Container(
      padding: EdgeInsets.all(5),
      child: Text(
        "คาดการณ์ซ่อมบำรุง",
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 18, color: Colors.orange, fontWeight: FontWeight.bold),
      ),
    );
  }

  Container buildTextFieldEngine() {
    return Container(
        margin: EdgeInsets.all(5),
        alignment: Alignment.center,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                'วันตรวรเช็คเรื่องยนต์',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Text(engine,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ));
  }

  Container buildTextFieldBattery() {
    return Container(
        margin: EdgeInsets.all(5),
        alignment: Alignment.center,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                'วันที่ตรวจเช็คแบตเตอรี่',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Text(battery,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ));
  }

  Container buildTextFieldCoolant() {
    return Container(
        margin: EdgeInsets.all(5),
        alignment: Alignment.center,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                'วันทีตรวจเช็คระบบหล่อเย็น',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Text(coolant,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ));
  }

  Container buildTextFieldFuel() {
    return Container(
        margin: EdgeInsets.all(5),
        alignment: Alignment.center,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                'วันที่ตรวจเช็คระบบเชื้อเพลิง',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Text(fuel,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ));
  }

  Container buildTextFieldAir() {
    return Container(
        margin: EdgeInsets.all(5),
        alignment: Alignment.center,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                'วันที่ตรวจเช็คเครื่องปรับอากาศ',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Text(aircondition,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ));
  }

  Container buildTextFieldPower() {
    return Container(
        margin: EdgeInsets.all(5),
        alignment: Alignment.center,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                'วันที่ตรวจเช็คระบบถ่ายทอดกำลัง(เกียร์)',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Text(powertrain,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ));
  }
    Container buildTextFieldbreking() {
    return Container(
        margin: EdgeInsets.all(5),
        alignment: Alignment.center,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                'วันที่ตรวจเช็คระบบเบรค',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Text(breaking,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ));
  }
    Container buildTextFieldTires() {
    return Container(
        margin: EdgeInsets.all(5),
        alignment: Alignment.center,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                'วันที่ตรวจเช็คระบบล้อ',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Text(tires,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ));
  }
      Container buildTextFieldSteering() {
    return Container(
        margin: EdgeInsets.all(5),
        alignment: Alignment.center,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                'วันที่ตรวจเช็คระบบบังคับเลี้ยว',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Text(steering,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ));
  }
}