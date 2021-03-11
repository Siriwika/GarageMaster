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
  double screen;
  @override
  
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    print('screen = $screen');
    return Scaffold(
        backgroundColor: Color.fromRGBO(239, 113, 40, 1),
        body: SafeArea(
            child: Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
              SizedBox(
                height: 2,
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: Text(
                  'Malya jerner',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    width: 130,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(251, 186, 110, 1),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15),
                            bottomRight: Radius.circular(15))),
                    child: Center(
                      child: Text(
                        'อู่ของฉัน',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'Prompt'),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                  child: Center(
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color.fromRGBO(196, 196, 196, 1)),
                          margin: EdgeInsets.all(20),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                buildButtonCradle(),
                              ])))),
              Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: 350,
                        height: 60,
                        child: RaisedButton(
                          color: Color.fromRGBO(196, 196, 196, 1),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CarInfo()));
                          },
                          child: Icon(Icons.add, size: 40, color: Colors.white),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                        ),
                      )
                    ],
                  ))
            ]))));
  }
}

Widget buildButtonCradle() {
  return Container(
      child: Row(
    children: <Widget>[
      Expanded(
        child: Image.network(
          'https://www.iamcar.net/wp-content/uploads/2017/07/%E0%B8%97%E0%B8%A3%E0%B8%B1%E0%B8%9E%E0%B8%A2%E0%B9%8C%E0%B8%A3%E0%B8%B8%E0%B9%88%E0%B8%87%E0%B9%80%E0%B8%A3%E0%B8%B7%E0%B8%AD%E0%B8%87%E0%B8%A2%E0%B8%B2%E0%B8%87%E0%B8%A2%E0%B8%99%E0%B8%95%E0%B9%8C.jpg',
          width: 200,
          height: 60,
          alignment: Alignment.centerLeft,
        ),
      ),
      Expanded(
        child: Text(
          'ร้านทรัพย์รุ่งเรือง',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
    ],
  ));
}
