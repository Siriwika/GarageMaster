import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:project1/Models/TestModel.dart';
import 'package:project1/addgarage/mygarage.dart';
import 'package:project1/utility/dialog.dart';

class Editser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Prompt'));
  }
}

// ignore: must_be_immutable
class EditService extends StatefulWidget {
  final GarageModel garageModels;
  String name;
  int uid;
  EditService(this.garageModels, this.name, this.uid);
  @override
  _EditServiceState createState() => _EditServiceState();
}

class _EditServiceState extends State<EditService> {
  Future<Map<dynamic, dynamic>> futureservice;
  double screen;
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

  // ignore: missing_return
  Future<void> _deleteAllservice(int gid) {
    if (gid != null) {
      futureservice = deleteAllservice(gid);
      print('{$futureservice}');
      //return futureservice;
    } else {
      throw 'cannot delete service';
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
                    child: Text('อัปเดตบริการ',
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
                          var obj = '{${sid[g]}}';
                          sId.add(obj);
                        }
                      }
                      print(sId);
                      _deleteAllservice(widget.garageModels.gId);
                      _startEdit();
                      print('success');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyGarge(
                                    uid: widget.uid,
                                    name: widget.name,
                                  )));
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

  void _startEdit() async {
    final Map<String, dynamic> response =
        await insertservice(sId.toString(), widget.garageModels.gId);
    print(response);
    if (response == null) {
      normalDialog(context, 'ล้มเหลว', 'แก้ไขบริการล้มเหลว ลองใหม่อีกครั้ง',5);
    } else {
      normalDialog(context, 'สำเร็จ', 'แก้ไขบริการเรียบร้อย',5);
    }
  }

  Future<Map<dynamic, dynamic>> deleteAllservice(int gid) async {
    final String pramsUrl =
        "http://139.59.229.66:5002/api/Garage/DeleteService?gid=$gid";

    final response = await http.delete(pramsUrl);

    if (response.statusCode != 200) {
      print(response);
    }
    print(response.body);
    Map<String, dynamic> reponseData = {"success": '${response.body}'};
    return reponseData;
  }

  Future<Map<dynamic, dynamic>> insertservice(String list, int gid) async {
    final String apiUrl = "http://139.59.229.66:5002/api/Garage/InsertService";
    final body = json.encode({"listTmp": list, "g_Id": gid});
    final response = await http.post(apiUrl,
        body: body,
        headers: {'Content-Type': 'application/json', 'Accept': '*/*'});
    if (response.statusCode != 200) {
      print(response);
    }
    print('${response.statusCode}');
    print('${response.body}');
    Map<String, dynamic> reponseData = {"success": '${response.body}'};
    return reponseData;
  }
}
