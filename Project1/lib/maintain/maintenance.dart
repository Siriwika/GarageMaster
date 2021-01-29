import 'package:Project1/maintain/maintenance2.dart';
import 'package:flutter/material.dart';

class Maintenance extends StatelessWidget {
  Maintenance({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final urlImage =
        'https://img.etimg.com/thumb/msid-73268134,width-640,resizemode-4,imgsize-35417/surprise-heard-of-a-sony-car.jpg';

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
        ),
        body: SafeArea(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
              Image.network(
                urlImage,
                height: 100,
                width: 200,
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
                            'Mazda2',
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
            ])));
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
                'อีก 2 เดือน',
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
                'ควรได้รับการซ่อมบำรุง',
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
                'อีก 2 เดือน',
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
                'อีก 2 เดือน',
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
                'อีก 2 เดือน',
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
                'อีก 2 เดือน',
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
