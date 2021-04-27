import 'package:flutter/material.dart';
import 'package:project1/tab/mapsid.dart';
import 'motercycleservice.dart';



class Servicetype extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Service(),
        theme: ThemeData(fontFamily: 'Prompt'));
  }
}

class Service extends StatefulWidget {
  @override
  _ServiceState createState() => _ServiceState();
}

class _ServiceState extends State<Service> {
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: screen * 0.25,
                        height: screen * 0.25,
                        child: RaisedButton(
                          onPressed: () {},
                          child: Text(
                            'รถยนต์',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          color: Color.fromRGBO(251, 186, 110, 1),
                        ),
                      ),
                      Container(
                        width: screen * 0.25,
                        height: screen * 0.25,
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Motercycle()));
                          },
                          child: Text(
                            'มอเตอร์ไซต์',
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        height: screen * 0.95,
                      )
                    ],
                  ),
                  Container(
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
                                child: buttontype('ครบวงจร',1),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                child: buttontype('เครื่องยนต์',2),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                child: buttontype('ระบบไฟฟ้ารถยนต์',3),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                child: buttontype('ช่วงล่าง',4),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                child: buttontype('แก๊สรถยนต์',5),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
    Widget buttontype(String name,int sid) => RaisedButton(
        onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Mappage2(sid)));
                  },
        color: Color.fromRGBO(84, 198, 214, 1),
        child: Text(
          name,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      );
}


  // ignore: non_constant_identifier_na