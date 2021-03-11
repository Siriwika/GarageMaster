import 'package:flutter/material.dart';
import 'package:project1/addgarage/mygarage.dart';
import 'package:project1/login.dart';

// ignore: camel_case_types
class profileLoginpage extends StatefulWidget {
  @override
  _profileLoginpageState createState() => _profileLoginpageState();
}

// ignore: camel_case_types
class _profileLoginpageState extends State<profileLoginpage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: profileLogin(),
      theme: ThemeData(fontFamily: 'Prompt'),
    );
  }
}

// ignore: camel_case_types
class profileLogin extends StatefulWidget {
  @override
  _profileLoginState createState() => _profileLoginState();
}

// ignore: camel_case_types
class _profileLoginState extends State<profileLogin> {
  double screen;
  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    print('screen = $screen');
    return Scaffold(
        backgroundColor: Color.fromRGBO(239, 113, 40, 1),
        body: SafeArea(
            child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyGarge()));
                          },
                          color: Color.fromRGBO(251, 186, 110, 1),
                          child: Text(
                            'อู่ของฉัน >',
                            style: TextStyle(color: Colors.white),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  bottomLeft: Radius.circular(15))),
                        ),
                      ),
                      SizedBox(
                        height: screen * 0.15,
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
                                'รถของฉัน',
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
                      SizedBox(
                        height: screen * 0.1,
                      ),
                      Container(
                          alignment: Alignment.center,
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: screen * 0.9,
                                height: screen * 0.15,
                                child: RaisedButton(
                                  color: Color.fromRGBO(251, 186, 110, 1),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Login()));
                                  },
                                  child: Text(
                                    'ล็อกอิน',
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.white),
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                ),
                              )
                            ],
                          ))
                    ]),
              ),
            ),
          ],
        )));
  }
}
