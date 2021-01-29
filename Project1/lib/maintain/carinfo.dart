import 'package:Project1/maintain/maintenance.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CarInfo(),
      theme: ThemeData(fontFamily: 'Prompt'),
    );
  }
}

class CarInfo extends StatefulWidget {
  CarInfo({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CarInfoState createState() => _CarInfoState();
}

class _CarInfoState extends State<CarInfo> {
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
    return Scaffold(
        backgroundColor: Colors.orange[100],
        body: SafeArea(
            child: Column(children: <Widget>[
          Column(
            children: <Widget>[
              Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                    alignment: Alignment.center,
                    height: 50,
                    width: 150,
                    decoration: ShapeDecoration(
                        color: Colors.orange,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50))),
                    child: Text(
                      'เพิ่มรถ',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),
            ],
          ),
          Column(children: <Widget>[
            Container(
              margin: EdgeInsets.all(15),
              child: RaisedButton(
                color: Colors.grey,
                onPressed: () {},
                child: Icon(Icons.add_a_photo, size: 40, color: Colors.white),
                padding: EdgeInsets.fromLTRB(80, 30, 80, 30),
              ),
            ),
            Container(
              padding: EdgeInsets.all(2),
              margin: EdgeInsets.fromLTRB(30, 20, 40, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    'ยี่ห้อรถ',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  TextField(),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    'วันที่ตรวจเช็คเรื่องยนต์',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${selectedDate.toLocal()}".split(' ')[0],
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  RaisedButton(
                    onPressed: () => _selectDate(context),
                    child:
                        Icon(Icons.date_range, size: 25, color: Colors.white),
                    color: Colors.orange,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    'วันที่ตรวจเช็คแบตเตอรี่',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${selectedDate.toLocal()}".split(' ')[0],
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  RaisedButton(
                    onPressed: () => _selectDate(context),
                    child:
                        Icon(Icons.date_range, size: 25, color: Colors.white),
                    color: Colors.orange,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    'วันที่ตรวจเช็คระบบหล่อเย็น',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${selectedDate.toLocal()}".split(' ')[0],
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  RaisedButton(
                    onPressed: () => _selectDate(context),
                    child:
                        Icon(Icons.date_range, size: 25, color: Colors.white),
                    color: Colors.orange,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    'วันที่ตรวจเช็คระบบเชื้อเพลิง',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${selectedDate.toLocal()}".split(' ')[0],
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  RaisedButton(
                    onPressed: () => _selectDate(context),
                    child:
                        Icon(Icons.date_range, size: 25, color: Colors.white),
                    color: Colors.orange,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    'วันที่ตรวจเช็คเครื่องปรับอากาศ',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${selectedDate.toLocal()}".split(' ')[0],
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  RaisedButton(
                    onPressed: () => _selectDate(context),
                    child:
                        Icon(Icons.date_range, size: 25, color: Colors.white),
                    color: Colors.orange,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.fromLTRB(50, 0, 50, 0),
                    height: 50,
                    width: 150,
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Maintenance()));
                      },
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
            ),
          ])
        ])));
  }
}
