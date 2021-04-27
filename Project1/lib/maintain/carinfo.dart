import 'dart:convert';
import 'dart:io';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:mime/mime.dart';
import 'package:http/http.dart' as http;
import 'package:project1/utility/dialog.dart';

class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Garage Master",
        home: CarInfo1(),
        theme: ThemeData(fontFamily: 'Prompt'));
  }
}

class CarInfo1 extends StatefulWidget {
  CarInfo1({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CarInfo1State createState() => _CarInfo1State();
}

class _CarInfo1State extends State<CarInfo1> {
  double screen;
  String cbrand;
  DateTime date1 = DateTime.now();
  DateTime date2 = DateTime.now();
  DateTime date3 = DateTime.now();
  DateTime date4 = DateTime.now();
  DateTime date5 = DateTime.now();
  DateTime date6 = DateTime.now();
  DateTime date7 = DateTime.now();
  DateTime date8 = DateTime.now();
  DateTime date9 = DateTime.now();
  File file;
  var image;
  final cbrandcontroller = TextEditingController();

  Uri uri = Uri.parse("http://139.59.229.66:5002/api/CarInfo/AddCarInfo");
  Future<Map<String, dynamic>> insertCar(
    String cBrand,
    File imagE,
    DateTime cEngine,
    DateTime cBattery,
    DateTime cCoolant,
    DateTime cFuel,
    DateTime cAirConditioning,
    DateTime cPowerTrain,
    DateTime cBraking,
    DateTime cTires,
    DateTime cSteering,
  ) async {
    final mimeTypeData = lookupMimeType(
      imagE.path,
      headerBytes: [0xFF, 0xD8],
    ).split('/');
    final imageUpload = http.MultipartRequest('POST', uri);

    final file = await http.MultipartFile.fromPath("FileImage", imagE.path,
        contentType: MediaType(mimeTypeData[0], mimeTypeData[1]));
    imageUpload.headers.addAll({
      'Content-Type': 'multipart/form-data',
      'Accept-Encoding-Type': 'gzip, deflate, br',
      'Accept-': '*/*',
    });
    print(file);
    print(imagE);
    imageUpload.fields['C_Brand'] = cBrand;
    imageUpload.files.add(file);
    imageUpload.fields['C_Engine'] = cEngine.toString();
    imageUpload.fields['C_Battery'] = cBattery.toString();
    imageUpload.fields['C_Coolant'] = cCoolant.toString();
    imageUpload.fields['C_Fuel'] = cFuel.toString();
    imageUpload.fields['C_AirConditioning'] = cAirConditioning.toString();
    imageUpload.fields['C_PowerTrain'] = cPowerTrain.toString();
    imageUpload.fields['C_Braking'] = cBraking.toString();
    imageUpload.fields['C_Tires'] = cTires.toString();
    imageUpload.fields['C_Steering'] = cSteering.toString();
    imageUpload.fields['UId'] = 1.toString();

    try {
      final streamedResponse = await imageUpload.send();
      final response = await http.Response.fromStream(streamedResponse);
      if (response.statusCode != 200) {
        print(response);
        return null;
      }
      final Map<String, dynamic> reponseData = json.decode(response.body);
      return reponseData;
    } catch (e) {
      print(e);
      return null;
    }
  }

  // Future<Carinfo> insertCar(
  //   String cBrand,
  //   File cImage,
  //   DateTime cEngine,
  //   DateTime cBattery,
  //   DateTime cCoolant,
  //   DateTime cFuel,
  //   DateTime cAirConditioning,
  //   DateTime cPowerTrain,
  //   DateTime cBraking,
  //   DateTime cTires,
  //   DateTime cSteering,
  // ) async {
  // var response =
  //     await http.post("http://139.59.229.66:5002/api/CarInfo/AddCarInfo",
  //         body: {
  //           "C_Brand": cBrand,
  //           "FileImage": cImage,
  //           "C_Engine": cEngine,
  //           "C_Battery": cBattery,
  //           "C_Coolant": cCoolant,
  //           "C_Fuel": cFuel,
  //           "C_AirConditioning": cAirConditioning,
  //           "C_PowerTrain": cPowerTrain,
  //           "C_Braking": cBraking,
  //           "C_Tires": cTires,
  //           "C_Steering": cSteering,
  //           "UId": 5
  //         },
  //         headers: {
  //           "Content-Type": "multipart/form-data",
  //           "Accept": "*/*",
  //           "Accept-Encoding": "gzip, deflate, br"
  //         },
  //         encoding: Encoding.getByName("utf-8"));
  //   if (response.statusCode == 201) {
  //     final String responseString = response.;
  //     return carinfoFromJson2(responseString);
  //   } else {
  //     return null;
  //   }
  // }

  _selectDate1(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: date1,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != date1)
      setState(() {
        date1 = picked;
      });
  }

  _selectDate2(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: date2,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != date2)
      setState(() {
        date2 = picked;
      });
  }

  _selectDate3(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: date3,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != date3)
      setState(() {
        date3 = picked;
      });
  }

  _selectDate4(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: date4,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != date4)
      setState(() {
        date4 = picked;
      });
  }

  _selectDate5(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: date5,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != date5)
      setState(() {
        date5 = picked;
      });
  }

  _selectDate6(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: date6,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != date6)
      setState(() {
        date6 = picked;
      });
  }

  _selectDate7(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: date7,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != date7)
      setState(() {
        date7 = picked;
      });
  }

  _selectDate8(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: date8,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != date8)
      setState(() {
        date8 = picked;
      });
  }

  _selectDate9(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: date9,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != date9)
      setState(() {
        date9 = picked;
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
                  margin: EdgeInsets.all(10),
                  child: Center(
                    child: ButtonTheme(
                      minWidth: screen * 0.9,
                      height: screen * 0.4,
                      child: file == null
                          ? addCarPic()
                          : //Row(
                          //children: [

                          image = Image.file(
                              file,
                              height: screen * 0.8,
                              width: screen * 0.8,
                              // width: screen * 0.7,
                            ),
                      // changeImage()
                      //  ],
                      //),
                    ),
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
                      TextField(
                        controller: cbrandcontroller,
                      ),
                      SizedBox(height: screen * 0.02),
                      Text(
                        'วันที่ตรวจเช็คเรื่องยนต์',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${date1.toLocal()}".split(' ')[0],
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: screen * 0.01,
                      ),
                      RaisedButton(
                        onPressed: () => _selectDate1(context)(context),
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
                        "${date2.toLocal()}".split(' ')[0],
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: screen * 0.01,
                      ),
                      RaisedButton(
                        onPressed: () => _selectDate2(context),
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
                        "${date3.toLocal()}".split(' ')[0],
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: screen * 0.01,
                      ),
                      RaisedButton(
                        onPressed: () => _selectDate3(context)(context),
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
                        "${date4.toLocal()}".split(' ')[0],
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: screen * 0.01,
                      ),
                      RaisedButton(
                        onPressed: () => _selectDate4(context),
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
                        "${date5.toLocal()}".split(' ')[0],
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: screen * 0.01,
                      ),
                      RaisedButton(
                        onPressed: () => _selectDate5(context),
                        child: Icon(Icons.date_range,
                            size: 25, color: Colors.white),
                        color: Colors.orange,
                      ),
                      SizedBox(
                        height: screen * 0.01,
                      ),
                      Text(
                        'วันที่ตรวจเช็คระบบส่งกำลัง',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${date6.toLocal()}".split(' ')[0],
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: screen * 0.01,
                      ),
                      RaisedButton(
                        onPressed: () => _selectDate6(context),
                        child: Icon(Icons.date_range,
                            size: 25, color: Colors.white),
                        color: Colors.orange,
                      ),
                      SizedBox(
                        height: screen * 0.01,
                      ),
                      Text(
                        'วันที่ตรวจเช็คเบรก',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${date7.toLocal()}".split(' ')[0],
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: screen * 0.01,
                      ),
                      RaisedButton(
                        onPressed: () => _selectDate7(context),
                        child: Icon(Icons.date_range,
                            size: 25, color: Colors.white),
                        color: Colors.orange,
                      ),
                      SizedBox(
                        height: screen * 0.01,
                      ),
                      Text(
                        'วันที่ตรวจเช็คยาง',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${date8.toLocal()}".split(' ')[0],
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: screen * 0.01,
                      ),
                      RaisedButton(
                        onPressed: () => _selectDate8(context),
                        child: Icon(Icons.date_range,
                            size: 25, color: Colors.white),
                        color: Colors.orange,
                      ),
                      SizedBox(
                        height: screen * 0.01,
                      ),
                      Text(
                        'วันที่ตรวจเช็คระบบบังคับเลี้ยว',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${date9.toLocal()}".split(' ')[0],
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: screen * 0.01,
                      ),
                      RaisedButton(
                        onPressed: () => _selectDate9(context),
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
                            cbrand = cbrandcontroller.text;
                            _startUpload();
                            print('success');
                            print(date1);
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => Profile()));
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

  void _startUpload() async {
    final Map<String, dynamic> response = await insertCar(cbrand, file, date1,
        date2, date3, date4, date5, date6, date7, date8, date9);
    print(response);
    if (response == null) {
      normalDialog(context, 'สำเร็จ', 'เพิ่มข้อมูลรถเรียบร้อย');
    } else {
      normalDialog(context, 'ล้มเหลว', 'เพิ่มข้อมูลรถล้มเหลว ลองใหม่อีกครั้ง');
      
    }
  }

  Widget addCarPic() {
    return RaisedButton(
      child: Icon(
        Icons.add,
        color: Colors.white,
        size: screen * 0.15,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      color: Colors.grey[400],
      onPressed: () => chooseImage(ImageSource.gallery),
    );
  }

  Future<Null> chooseImage(ImageSource imageSource) async {
    try {
      // ignore: deprecated_member_use
      var object = await ImagePicker.pickImage(
          source: imageSource, maxHeight: 800.0, maxWidth: 800.0);
      setState(() {
        file = object;
      });
    } catch (e) {}
  }
}
