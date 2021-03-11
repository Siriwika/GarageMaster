import 'package:project1/type/typestyle.dart';
import 'package:flutter/material.dart';


class MoterServicetype extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Motercycle(),
        theme: ThemeData(fontFamily: 'Prompt'));
  }
}

class Motercycle extends StatefulWidget {
  @override
  _MotercycleState createState() => _MotercycleState();
}

class _MotercycleState extends State<Motercycle> {
  double screen;
  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    print('screen = $screen');
    return Scaffold(
      backgroundColor: Color.fromRGBO(239, 113, 40, 1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: screen * 0.35,
                  height: screen * 0.15,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(251, 186, 110, 1),
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                    child: Text('ประเภท',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              SizedBox(
                height: screen * 0.02,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Container(
                        width: screen * 0.25,
                        height: screen * 0.25,
                        child: RaisedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'รถยนต์',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                            color: Colors.grey),
                      ),
                      Container(
                        width: screen * 0.25,
                        height: screen * 0.25,
                        child: RaisedButton(
                          onPressed: () {},
                          child: Text(
                            'มอเตอร์ไซต์',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          color: Color.fromRGBO(251, 186, 110, 1),
                        ),
                      ),
                      SizedBox(
                        height: screen * 0.95,
                      )
                    ],
                  ),
                  MotercycleService()
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Container MotercycleService() {
    return Container(
      height: screen * 1.45,
      width: screen * 0.7,
      decoration: BoxDecoration(
          color: Color.fromRGBO(252, 207, 153, 1),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              bottomRight: Radius.circular(30),
              bottomLeft: Radius.circular(30))),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Mystyle().Buttontype('ครบวงจร'),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Mystyle().Buttontype('ปะ/เปลี่ยนยาง'),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Mystyle().Buttontype('ระบบไฟฟ้า'),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Mystyle().Buttontype('เครื่อง/ระบบเบรค'),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Mystyle().Buttontype('แก๊สรถยนต์'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
