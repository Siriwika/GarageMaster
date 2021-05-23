import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mime/mime.dart';
import 'package:http/http.dart' as http;
import 'package:project1/utility/dialog.dart';
import 'package:http_parser/http_parser.dart';

main() {
  runApp(Garagestep3());
}

class Garagestep3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyGarage3(
        gCharge: null,
        gCloseT: null,
        gDate: '',
        gName: '',
        gOpenT: null,
        gphone: '',
        gServiceType: '',
        image: null,
        lat: null,
        long: null,
      ),
      theme: ThemeData(fontFamily: 'Prompt'),
    );
  }
}

// ignore: must_be_immutable
class MyGarage3 extends StatefulWidget {
  String gServiceType;
  String gDate;
  String gCharge;
  String gName, gdescription;
  String gOpenT;
  String gCloseT;
  String lat;
  String long;
  String gphone;
  File image;

  MyGarage3(
      {Key key,
      @required this.gName,
      this.gdescription,
      @required this.image,
      @required this.gCharge,
      @required this.gCloseT,
      @required this.gDate,
      @required this.gOpenT,
      @required this.gServiceType,
      @required this.gphone,
      @required this.lat,
      @required this.long,
      })
      : super(key: key);

  @override
  _MyGarage3State createState() => _MyGarage3State();
}

class _MyGarage3State extends State<MyGarage3> {
  double screen;
  var listAsJson;
  String i;
  var msv1 = '0';
  var msv2 = '0';
  var msv3 = '0';
  var msv4 = '0';
  var csv1 = '0';
  var csv2 = '0';
  var csv3 = '0';
  var csv4 = '0';
  var csv5 = '0';
  String body;
  List<String> addString = [];
  List<String> sid = [];
  List<String> sId = [];
  bool msv1check = false;
  bool msv2check = false;
  bool msv3check = false;
  bool msv4check = false;
  bool csv1check = false;
  bool csv2check = false;
  bool csv3check = false;
  bool csv4check = false;
  bool csv5check = false;
  bool spName1check = false;
  bool spName2check = false;

  sandsid() async {
    for (int i = 0; i < 9; i++) {
      return sid[i];
    }
  }

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size.width;
    print('screen = $screen');
    return Scaffold(
      backgroundColor: Color.fromRGBO(239, 113, 40, 1),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    child: text('บริการของอู่'),
                  ),
                ),
                SizedBox(
                  height: screen * 0.05,
                ),
                text('รถยนต์'),
                Row(
                  children: [
                    Checkbox(
                        value: csv1check,
                        onChanged: (value) {
                          setState(() {
                            csv1check = value;
                            if (value = true) {
                              csv1 = 'SId: 1';
                              print(csv1);
                            }
                          });
                        }),
                    Text('ครบวงจร'),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                        value: csv2check,
                        onChanged: (value) {
                          setState(() {
                            csv2check = value;
                            if (value = true) {
                              csv2 = 'SId: 2';
                              print(csv2);
                            }
                          });
                        }),
                    Text('เครื่องยนต์'),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                        value: csv3check,
                        onChanged: (value) {
                          setState(() {
                            csv3check = value;
                            if (value = true) {
                              csv3 = 'SId: 3';
                              print(csv3);
                            }
                          });
                        }),
                    Text('ระบบไฟฟ้ารถยนต์'),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                        value: csv4check,
                        onChanged: (value) {
                          setState(() {
                            csv4check = value;
                            if (value = true) {
                              csv4 = 'SId: 4';
                              print(csv4);
                            }
                          });
                        }),
                    Text('ช่วงล่าง'),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                        value: csv5check,
                        onChanged: (value) {
                          setState(() {
                            csv5check = value;
                            if (value = true) {
                              csv5 = 'SId: 5';
                              print(csv5);
                            }
                          });
                        }),
                    Text('แก๊สรถยนต์'),
                  ],
                ),
                text('มอเตอร์ไซต์'),
                Row(
                  children: [
                    Checkbox(
                        value: msv1check,
                        onChanged: (value) {
                          setState(() {
                            msv1check = value;
                            if (value = true) {
                              msv1 = 'SId: 6';
                              print(msv1);
                            }
                          });
                        }),
                    Text('ครบวงจร'),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                        value: msv2check,
                        onChanged: (value) {
                          setState(() {
                            msv2check = value;
                            if (value = true) {
                              msv2 = 'SId: 7';
                              print(msv2);
                            }
                          });
                        }),
                    Text('ปะ/เปลี่ยนยาง'),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                        value: msv3check,
                        onChanged: (value) {
                          setState(() {
                            msv3check = value;
                            if (value = true) {
                              msv3 = 'SId: 8';
                              print(msv3);
                            }
                          });
                        }),
                    Text('ระบบไฟฟ้า'),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                        value: msv4check,
                        onChanged: (value) {
                          setState(() {
                            msv4check = value;
                            if (value = true) {
                              msv4 = 'SId: 9';
                              print(msv4);
                            }
                          });
                        }),
                    Text('เครื่อง/ระบบเบรค'),
                  ],
                ),
                SizedBox(
                  height: screen * 0.05,
                ),
                Container(
                  child: Center(
                      child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    color: Colors.green,
                    child: Text('เสร็จสิ้น',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        )),
                    onPressed: () async {
                      sid.add(csv1);
                      sid.add(csv2);
                      sid.add(csv3);
                      sid.add(csv4);
                      sid.add(csv5);
                      sid.add(msv1);
                      sid.add(msv2);
                      sid.add(msv3);
                      sid.add(msv4);

                      for (int g = 0; g < 9; g++) {
                        if (sid[g] != '0') {
                          var obj='{${sid[g]}}';
                          sId.add(obj);
                        }
                      }
                      print(sId);
                      // String f = '{${sId.first}';
                      // print(f);
                      // String l = '${sId.last}}';
                      // print(l);
                      // sId[0] = f;
                      // sId.last = l;
                      // print(sId);

                      _startUpload();
                      print('success');
                    },
                  )),
                ),
              ],
            ),
          ))
        ],
      )),
    );
  }

  Uri uri = Uri.parse("http://139.59.229.66:5002/api/Garage/AddGarage");
  Future<Map<dynamic, dynamic>> uploadG(
      File imagE,
      String gName,
      String gdescription,
      String gphone,
      String gDate,
      String lat,
      String long,
      String gCharge,
      String gServiceType,
      String gOpenT,
      String gCloseT,
      String lis) async {
    final mimeTypeData = lookupMimeType(
      imagE.path,
      headerBytes: [0xFF, 0xD8],
    ).split('/');
    final imageUpload = http.MultipartRequest('POST', uri);

    final file = await http.MultipartFile.fromPath("fileImage", imagE.path,
        contentType: MediaType(mimeTypeData[0], mimeTypeData[1]));
    imageUpload.headers.addAll({
      'Content-Type': 'multipart/form-data',
      'Accept-Encoding-Type': 'gzip, deflate, br',
      'Accept-': '*/*',
    });
    print(file);
    print(imagE);
    print(sId.toString());
    // String o = '[{"SId": 1, "SId": 3, "SId": 7, "SId": 8}]';
    print(gName);
    print(gdescription);
    print(gphone);
    print(gDate);
    print(lat);
    print(long);
    print(gCharge);
    print(gServiceType);
    print(lis);
    print(gOpenT);
    print(gCloseT);
    imageUpload.fields['G_Name'] = gName;
    imageUpload.fields['G_Description'] = gdescription;
    imageUpload.fields['G_Phone'] = gphone;
    imageUpload.fields['G_Date'] = gDate;
    imageUpload.fields['G_Latitude'] = lat;
    imageUpload.fields['G_Longitude'] = long;
    imageUpload.fields['G_charge'] = gCharge;
    imageUpload.fields['G_Service_Type'] = gServiceType;
    imageUpload.fields['listTmp'] = lis;
    imageUpload.files.add(file);
    imageUpload.fields['G_Open_Time'] = gOpenT;
    imageUpload.fields['G_Close_Time'] = gCloseT;
    imageUpload.fields['UId'] = 2.toString();

    try {
      final streamedResponse = await imageUpload.send();
      final response = await http.Response.fromStream(streamedResponse);
      if (response.statusCode != 200) {
        print(response);
      }
      print(response.body);
      Map<String, dynamic> reponseData = {"success":'${response.body}'};
      return reponseData;
    } catch (e) {
      print(e);
      return null;
    }
  }

  void _startUpload() async {
    final Map<String, dynamic> response = await uploadG(
        widget.image,
        widget.gName,
        widget.gdescription,
        widget.gphone,
        widget.gDate,
        widget.lat,
        widget.long,
        widget.gCharge,
        widget.gServiceType,
        widget.gOpenT,
        widget.gCloseT,
        sId.toString());
    print(response);
    if (response == null) {
      normalDialog(context, 'ล้มเหลว', 'สร้างอู่ล้มเหลว ลองใหม่อีกครั้ง');
    } else {
      normalDialog(context, 'สำเร็จ', 'สร้างอู่เรียบร้อย');
    }
  }

  BoxDecoration bgInput() {
    return BoxDecoration(
      color: Colors.white,
      border: Border.all(width: 0, color: Colors.white),
      borderRadius: const BorderRadius.all(const Radius.circular(25)),
    );
  }

  InputDecoration textborderside(String hint) {
    return InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(borderSide: BorderSide.none));
  }

  Text text(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}

