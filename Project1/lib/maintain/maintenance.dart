import 'package:flutter/services.dart';
import 'package:project1/maintain/carinfo.dart';
import 'package:project1/maintain/maintenance2.dart';
import 'package:flutter/material.dart';
import 'package:project1/Models/carModel.dart';


void main() {
  runApp(Maintenance());
}
// ignore: must_be_immutable
class Maintenance extends StatefulWidget {
  @override
  _MaintenanceState createState() => _MaintenanceState();
}


class Maintain extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Carinfo",
        theme: ThemeData(fontFamily: 'Prompt'));
  }
}


class _MaintenanceState extends State<Maintenance> {

Future<List<Carinfo>> futureCar;
List<Carinfo> value;
  double screen;
  
  @override
  void initState() {
    super.initState();
    futureCar = fetchCarinfo();
  }

    Future<String> getJsonFile(String path) async {
    return await rootBundle.loadString(path);
  }


  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    print('screen = $screen');
    return Scaffold(
       backgroundColor: Color.fromRGBO(239, 113, 40, 1),
       body:FutureBuilder(
         future: futureCar,
         builder: (BuildContext context , AsyncSnapshot<dynamic> snapshot){
      if(snapshot.connectionState == ConnectionState.done){
            var result = snapshot.data;
          return SafeArea(
            child: Expanded(
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: screen * 0.02,
                  ),
                  Image.network(
                    ,
                    height: screen * 0.3,
                    width: screen * 0.5,
                    fit: BoxFit.cover,
                  ),
                  Center(
                    child: Container(
                        margin: EdgeInsets.all(5),
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
                              child: Text(
                                value.cBrand,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.green,
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
                                    builder: (context) => Maintenance2()));
                          },
                          child: Text(
                            'อัพเดท',
                            style: TextStyle(
                                color: Colors.orange,
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
                            // buildButtonSignIn(context),
                          ],
                        )),
                  ))
                ]),
          ),
        )));
          }
          return LinearProgressIndicator();
         },
         )
         );
  }
      
  // Widget buildButtonSignIn(BuildContext context) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.center,
  //     children: <Widget>[
  //       Container(
  //           margin: EdgeInsets.fromLTRB(50, 20, 50, 0),
  //           child: RaisedButton(
  //             onPressed: () {
  //               Navigator.push(context,
  //                   MaterialPageRoute(builder: (context) => Maintenance2()));
  //             },
  //             color: Colors.green[300],
  //             child: Text(
  //               'ยืนยัน',
  //               style: TextStyle(color: Colors.white),
  //             ),
  //           )),
  //     ],
  //   );
  // }

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
              child: Text(
                widget.carinfo.cEngine.toString(),
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
              child: Text(
                widget.carinfo.cBattery.toString(),
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
              child: Text(
                widget.carinfo.cCoolant.toString(),
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
              child: Text(
                widget.carinfo.cFuel.toString(),
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
              child: Text(
                widget.carinfo.cAirConditioning.toString(),
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
              child: Text(
                widget.carinfo.cPowerTrain.toString(),
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
                'วันที่ตรวจเช็คยางรถยนต์',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Text(
                widget.carinfo.cTires.toString(),
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
                'วันที่ตรวจเช็คยางรถยนต์',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Text(
                widget.carinfo.cSteering.toString(),
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



