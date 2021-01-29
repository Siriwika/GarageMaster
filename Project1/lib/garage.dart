import 'package:Project1/maintain/carinfo.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DetaiPage(title: 'DetaiPage'),
      theme: ThemeData(fontFamily: 'Prompt'),
    );
  }
}

class DetaiPage extends StatefulWidget {
  DetaiPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DetaiPage createState() => _DetaiPage();
}

class _DetaiPage extends State<DetaiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange[100],
        body: SafeArea(
            child: Container(
                margin: EdgeInsets.all(20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        'Malya jerner',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      Column(children: <Widget>[
                        Column(
                          children: <Widget>[
                            Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  alignment: Alignment.center,
                                  height: 50,
                                  width: 110,
                                  decoration: ShapeDecoration(
                                      color: Colors.orange,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50))),
                                  child: Text(
                                    'อู่ของฉัน',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic,
                                      fontFamily: 'Prompt',
                                    ),
                                  ),
                                )),
                          ],
                        ),
                        Container(
                            child: Center(
                                child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        color: Colors.orange[300]),
                                    margin: EdgeInsets.all(20),
                                    padding: EdgeInsets.all(20),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          buildButtonCradle(),
                                        ])))),
                        Container(
                            alignment: Alignment.center,
                            child: Column(
                              children: <Widget>[
                                RaisedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => CarInfo()));
                                  },
                                  child: Icon(Icons.add,
                                      size: 40, color: Colors.white),
                                )
                              ],
                            ))
                      ])
                    ]))));
  }
}

Widget buildButtonCradle() {
  return Container(
      alignment: Alignment.center,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              'ร้านทรัพย์รุ่งเรือง',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: TextField(),
          )
        ],
      ));
}
