import 'package:flutter/material.dart';


// ignore: must_be_immutable
class Maintenance2 extends StatelessWidget {
  double screen;
  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    print('screen = $screen');
    final urlImage =
        'https://img.etimg.com/thumb/msid-73268134,width-640,resizemode-4,imgsize-35417/surprise-heard-of-a-sony-car.jpg';

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
                  Image.network(
                    urlImage,
                    height: 100,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                  Center(
                    child: Container(
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.fromLTRB(70, 20, 100, 0),
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
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        )),
                  ),
                  Container(
                      child: Center(
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.orange[100]),
                        margin: EdgeInsets.all(20),
                        padding: EdgeInsets.all(24),
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
                            buildButtonSignIn(context),
                          ],
                        )),
                  ))
                ]),
          ),
        )));
  }

  Widget buildButtonSignIn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
            margin: EdgeInsets.fromLTRB(50, 40, 50, 0),
            height: 50,
            width: 150,
            child: RaisedButton(
              onPressed: () {},
              color: Colors.green[300],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'ยืนยัน',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            )),
      ],
    );
  }

  Container buildTextFieldEmail() {
    return Container(
      child: Text(
        "อัพเดทวันที่",
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 18, color: Colors.orange, fontWeight: FontWeight.bold),
      ),
    );
  }

  Container buildTextFieldEngine() {
    return Container(
        alignment: Alignment.center,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                'วันตรวรเช็คเรื่องยนต์',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: TextField(),
            )
          ],
        ));
  }

  Container buildTextFieldBattery() {
    return Container(
        alignment: Alignment.center,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                'วันที่ตรวจเช็คแบตเตอรี่',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: TextField(),
            )
          ],
        ));
  }

  Container buildTextFieldCoolant() {
    return Container(
        alignment: Alignment.center,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                'วันทีตรวจเช็คระบบหล่อเย็น',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: TextField(),
            )
          ],
        ));
  }

  Container buildTextFieldFuel() {
    return Container(
        alignment: Alignment.center,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                'วันที่ตรวจเช็คระบบเชื้อเพลิง',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: TextField(),
            )
          ],
        ));
  }

  Container buildTextFieldAir() {
    return Container(
        alignment: Alignment.center,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                'วันที่ตรวจเช็คเครื่องปรับอากาศ',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: TextField(),
            )
          ],
        ));
  }

  Container buildTextFieldPower() {
    return Container(
        alignment: Alignment.center,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                'วันที่ตรวจเช็คระบบถ่ายทอดกำลัง(เกียร์)',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: TextField(),
            )
          ],
        ));
  }
}
