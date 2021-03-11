import 'package:project1/addgarage/mygarage.dart';
import 'package:project1/maintain/carinfo.dart';
import 'package:flutter/material.dart';


class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Profile(),
      theme: ThemeData(fontFamily: 'Prompt'),
    );
  }
}

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
                      Container(
                          child: Center(
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Color.fromRGBO(196, 196, 196, 1)),
                                  margin: EdgeInsets.all(20),
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
                              Container(
                                width: screen * 0.9,
                                height: screen * 0.15,
                                child: RaisedButton(
                                  color: Color.fromRGBO(196, 196, 196, 1),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => CarInfo()));
                                  },
                                  child: Icon(Icons.add,
                                      size: 40, color: Colors.white),
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

Widget buildButtonCradle() {
  return Container(
      child: Row(
    children: <Widget>[
      Expanded(
        child: Image.network(
          'https://www.thairath.co.th/media/B6FtNKtgSqRqbnNsU0Udl3NPkoFFyfqDYbyT1l69T43VQFr6D2i58jSv4VPoHprRZUSKS.jpg',
          width: 200,
          height: 60,
          alignment: Alignment.centerLeft,
        ),
      ),
      Expanded(
        child: Text(
          'Mazda3',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    ],
  ));
}
