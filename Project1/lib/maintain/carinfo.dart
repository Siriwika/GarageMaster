import 'package:project1/maintain/maintenance.dart';
import 'package:flutter/material.dart';


class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Garage Master",
        home: CarInfo(),
        theme: ThemeData(fontFamily: 'Prompt'));
  }
}

class CarInfo extends StatefulWidget {
  CarInfo({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CarInfoState createState() => _CarInfoState();
}

class _CarInfoState extends State<CarInfo> {
  double screen;
  DateTime selectedDate = DateTime.now();

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    print('screen = $screen');
    return Scaffold(
        backgroundColor: Color.fromRGBO(239, 113, 40, 1),
        body: SafeArea(
            child: Column(children: <Widget>[
          Column(
            children: <Widget>[
              Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
                    width: screen * 0.3,
                    height: screen * 0.13,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(251, 186, 110, 1),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15),
                            bottomRight: Radius.circular(15))),
                    child: Center(
                      child: Text(
                        'เพิ่มรถ',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(children: <Widget>[
                Container(
                  width: screen * 0.9,
                  height: screen * 0.15,
                  margin: EdgeInsets.all(10),
                  child: RaisedButton(
                    color: Color.fromRGBO(196, 196, 196, 1),
                    onPressed: () {},
                    child: Center(
                        child: Icon(Icons.add_a_photo,
                            size: 30, color: Colors.white)),
                    padding: EdgeInsets.fromLTRB(80, 10, 80, 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'ยี่ห้อรถ',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      TextField(),
                      SizedBox(height: screen * 0.02),
                      Text(
                        'วันที่ตรวจเช็คเรื่องยนต์',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${selectedDate.toLocal()}".split(' ')[0],
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: screen * 0.01,
                      ),
                      RaisedButton(
                        onPressed: () => _selectDate(context),
                        child: Icon(Icons.date_range,
                            size: 25, color: Colors.white),
                        color: Colors.orange,
                      ),
                      SizedBox(
                        height: screen * 0.01,
                      ),
                      Text(
                        'วันที่ตรวจเช็คแบตเตอรี่',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${selectedDate.toLocal()}".split(' ')[0],
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: screen * 0.01,
                      ),
                      RaisedButton(
                        onPressed: () => _selectDate(context),
                        child: Icon(Icons.date_range,
                            size: 25, color: Colors.white),
                        color: Colors.orange,
                      ),
                      SizedBox(
                        height: screen * 0.01,
                      ),
                      Text(
                        'วันที่ตรวจเช็คระบบหล่อเย็น',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${selectedDate.toLocal()}".split(' ')[0],
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: screen * 0.01,
                      ),
                      RaisedButton(
                        onPressed: () => _selectDate(context),
                        child: Icon(Icons.date_range,
                            size: 25, color: Colors.white),
                        color: Colors.orange,
                      ),
                      SizedBox(
                        height: screen * 0.01,
                      ),
                      Text(
                        'วันที่ตรวจเช็คระบบเชื้อเพลิง',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${selectedDate.toLocal()}".split(' ')[0],
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: screen * 0.01,
                      ),
                      RaisedButton(
                        onPressed: () => _selectDate(context),
                        child: Icon(Icons.date_range,
                            size: 25, color: Colors.white),
                        color: Colors.orange,
                      ),
                      SizedBox(
                        height: screen * 0.01,
                      ),
                      Text(
                        'วันที่ตรวจเช็คเครื่องปรับอากาศ',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${selectedDate.toLocal()}".split(' ')[0],
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: screen * 0.01,
                      ),
                      RaisedButton(
                        onPressed: () => _selectDate(context),
                        child: Icon(Icons.date_range,
                            size: 25, color: Colors.white),
                        color: Colors.orange,
                      ),
                      SizedBox(
                        height: screen * 0.03,
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.fromLTRB(50, 0, 50, 0),
                        height: screen * 0.125,
                        width: screen * 0.4,
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Maintenance()));
                          },
                          color: Color.fromRGBO(37, 134, 41, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            'ยืนยัน',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        )),
                  ],
                ),
                SizedBox(
                  height: screen * 0.02,
                ),
              ]),
            ),
          )
        ])));
  }
}
