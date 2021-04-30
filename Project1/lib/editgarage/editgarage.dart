import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'package:mime/mime.dart';
import 'package:project1/Models/TestModel.dart';
import 'package:http/http.dart' as http;
import 'package:project1/addgarage/mygarage.dart';
import 'package:project1/utility/dialog.dart';

class Editgarage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Prompt'));
  }
}

// ignore: must_be_immutable
class EditG extends StatefulWidget {
  final GarageModel garageModels;
  int uid;
  String name;
  EditG({Key key, @required this.uid, @required this.name, this.garageModels});

  @override
  _EditGState createState() => _EditGState();
}

class _EditGState extends State<EditG> {
  // Future<List<ServiceModel>> futureservice;
  // List<ServiceModel> values;
  double screen;
  int charge;
  int gid;
  int _gCharge;
  double lat, long;
  String call;
  String service;
  String distkm;
  String _gDate;
  String gphone;
  String _gServiceType;
  TimeOfDay opentime;
  TimeOfDay closetime;
  CameraPosition position;
  File file;
  final gNAMEcontroller = TextEditingController();
  final gDescriptioncontroller = TextEditingController();
  final gphonecontroller = TextEditingController();
  final gc = TextEditingController();
  File img;
  String name;
  String des;
  String phonNO;
  String gd;
  TimeOfDay opT;
  TimeOfDay cT;
  String gC;
  String gst;
  String gopT;
  String gcT;
  String baseImg;
  MultipartFile file1;

  void initState() {
    super.initState();
    opentime = TimeOfDay.fromDateTime(
        DateTime.parse((widget.garageModels.gOpenTime).toString()));
    closetime = TimeOfDay.fromDateTime(
        DateTime.parse((widget.garageModels.gCloseTime).toString()));
    findLatLong();
  }

  Future<Null> findLatLong() async {
    LocationData locationdata = await findlocation();
    setState(() {
      lat = locationdata.latitude;
      long = locationdata.longitude;
      //post api ตรงนี้ได้
      print('latitude = $lat ,longitude = $long');
    });
  }

  Future<LocationData> findlocation() async {
    Location location = Location();
    try {
      return await location.getLocation();
    } catch (e) {
      return null;
    }
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

  @override
  Widget build(BuildContext context) {
    charge = widget.garageModels.gCharge;
    screen = MediaQuery.of(context).size.width;
    call = widget.garageModels.gPhone;
    TimeOfDay gOpenT = opentime;
    TimeOfDay gCloseT = closetime;
    // distkm = format(widget.garageModels.km);
    gid = widget.garageModels.gId;
    return Scaffold(
      backgroundColor: Color.fromRGBO(239, 113, 40, 1),
      appBar: AppBar(
        title: Text(
          'แก้ไขข้อมูลอู่',
          style: TextStyle(
              fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromRGBO(239, 113, 40, 1),
        elevation: 0,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Container(
              child: ButtonTheme(
                minWidth: screen * 0.9,
                height: screen * 0.4,
                child: file == null
                    ? Column(
                        children: [netwrokImge(), changeImage()],
                      )
                    : Column(
                        children: [
                          Image.file(
                            file,
                            height: screen * 0.55,
                            width: screen * 0.8,
                          ),
                          SizedBox(
                            height: screen * 0.04,
                          ),
                          changeImage()
                        ],
                      ),
              ),
            ),
            SizedBox(
              height: screen * 0.04,
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: screen * 0.2,
                  child: Text(
                    'ชื่อร้าน',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          const BorderRadius.all(const Radius.circular(25)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: TextFormField(
                          controller: gNAMEcontroller,
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          decoration:
                              textborderside('${widget.garageModels.gName}')),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              alignment: FractionalOffset.centerLeft,
              child: Text(
                'คำบรรยาย',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 1),
                border: Border.all(
                    width: 1, color: Color.fromRGBO(255, 255, 255, 1)),
                borderRadius: const BorderRadius.all(const Radius.circular(25)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextFormField(
                  controller: gDescriptioncontroller,
                  keyboardType: TextInputType.multiline,
                  maxLines: 8,
                  decoration:
                      textborderside('${widget.garageModels.gDescription}'),
                  textInputAction: TextInputAction.next,
                ),
              ),
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: screen * 0.3,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: text('เบอร์โทร')),
                  ),
                ),
                SizedBox(
                  width: screen * 0.6,
                  child: Container(
                    height: screen * 0.13,
                    decoration: bgInput(),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 6, top: 18),
                      child: Center(
                        child: TextField(
                          controller: gphonecontroller,
                          // onChanged: (value) => gphone = value.trim(),
                          keyboardType: TextInputType.phone,
                          textInputAction: TextInputAction.next,
                          decoration:
                              textborderside('${widget.garageModels.gPhone}'),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: screen * 0.02,
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: screen * 0.3,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: text('เวลาทำการ')),
                  ),
                ),
                SizedBox(
                  width: screen * 0.2,
                  child: Container(
                    decoration: bgInput(),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: DropdownButton(
                          value: _gDate,
                          hint: Text(widget.garageModels.gDate),
                          items: [
                            DropdownMenuItem(
                              child: Text("ทุกวัน"),
                              value: "ทุกวัน",
                            ),
                            DropdownMenuItem(
                              child: Text("จ.- ศ."),
                              value: "จ.- ศ.",
                            )
                          ],
                          onChanged: (value) {
                            setState(() {
                              _gDate = value;
                              print(_gDate);
                            });
                          }),
                    ),
                  ),
                ),
              ],
            ),
            ListTile(
              title: Text(
                'ตั้งแต่: ${opentime.hour}:${opentime.minute}น.',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              trailing: Icon(Icons.keyboard_arrow_down),
              onTap: _pickTime,
            ),
            ListTile(
              title: Text(
                'ถึง: ${closetime.hour}:${closetime.minute}น.',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              trailing: Icon(Icons.keyboard_arrow_down),
              onTap: _pickTime2,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: text('ที่ตั้ง (ตำแหน่งปัจุจบัน)  ')),
            addGLocation(),
            //แสดงแผนที่เอาค่าที่อยู่ร้าน
            SizedBox(
              height: screen * 0.02,
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: screen * 0.4,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: text('ค่าบริการเริ่มต้น')),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: screen * 0.13,
                    decoration: bgInput(),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 6, top: 18),
                      child: Center(
                        child: TextField(
                          controller: gc,
                          onChanged: (value) {
                            setState(() {
                              _gCharge = int.parse(value);
                              print(_gCharge);
                            });
                          },
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.done,
                          decoration:
                              textborderside('${widget.garageModels.gCharge}'),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                    width: screen * 0.25,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Align(
                          alignment: Alignment.centerLeft, child: text('บาท')),
                    )),
              ],
            ),
            SizedBox(
              height: screen * 0.05,
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: screen * 0.4,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: text('รูปแบบบริการ')),
                  ),
                ),
                SizedBox(
                  width: screen * 0.36,
                  child: Container(
                    decoration: bgInput(),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: DropdownButton(
                          value: _gServiceType,
                          hint: Text(widget.garageModels.gServiceType),
                          items: [
                            DropdownMenuItem(
                              child: Text("เฉพาะที่อู่เท่านั้น"),
                              value: "เฉพาะที่อู่เท่านั้น",
                            ),
                            DropdownMenuItem(
                              child: Text("ไปหาถึงที่ได้"),
                              value: "ไปหาถึงที่ได้",
                            )
                          ],
                          onChanged: (value) {
                            setState(() {
                              _gServiceType = value;
                              print(_gServiceType);
                            });
                          }),
                    ),
                  ),
                ),
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
                child: Text('อัพเดทข้อมูล',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    )),
                onPressed: () async {
                  if (file == null) {
                    baseImg = widget.garageModels.gImage;
                    file1 = http.MultipartFile.fromString("FileImage", "null");
                    print(baseImg);
                  } else {
                    img = file;
                    final mimeTypeData = lookupMimeType(
                      img.path,
                      headerBytes: [0xFF, 0xD8],
                    ).split('/');
                    file1 = await http.MultipartFile.fromPath(
                        "FileImage", img.path,
                        contentType:
                            MediaType(mimeTypeData[0], mimeTypeData[1]));
                    print(file1);
                    baseImg = null;
                  }
                  if (gNAMEcontroller.text.isEmpty) {
                    name = widget.garageModels.gName;
                    print(name);
                  } else {
                    name = gNAMEcontroller.text;
                    print(name);
                  }

                  if (gDescriptioncontroller.text.isEmpty) {
                    des = widget.garageModels.gDescription;
                    print(des);
                  } else {
                    des = gDescriptioncontroller.text;
                    print(des);
                  }

                  if (gphonecontroller.text.isEmpty) {
                    phonNO = widget.garageModels.gPhone;
                    print(phonNO);
                  } else {
                    phonNO = gphonecontroller.text;
                  }

                  if (_gDate == null) {
                    gd = widget.garageModels.gDate;
                    print(gd);
                  } else {
                    gd = _gDate;
                    print(gd);
                  }

                  if (gOpenT == opentime) {
                    opT = opentime;
                    print(opT);
                  } else {
                    opT = gOpenT;
                    print(opT);
                  }

                  if (gCloseT == closetime) {
                    cT = closetime;
                    print(cT);
                  } else {
                    cT = gCloseT;
                    print(cT);
                  }

                  if (_gCharge == null) {
                    gC = widget.garageModels.gCharge.toString();
                    print(gC);
                  } else {
                    gC = _gCharge.toString();
                    print(gC);
                  }

                  if (_gServiceType == null) {
                    gst = widget.garageModels.gServiceType;
                    print(gst);
                  } else {
                    gst = _gServiceType;
                    print(gst);
                  }
                  final localizations = MaterialLocalizations.of(context);
                  gopT = localizations.formatTimeOfDay(opT);
                  gcT = localizations.formatTimeOfDay(cT);
                  _startdate();
                },
              )),
            ),
          ],
        ),
      )),
    );
  }

  Container addGLocation() {
    if (lat != null) {
      LatLng latLng = LatLng(lat, long);
      position = CameraPosition(target: latLng, zoom: 16.0);
    }

    Marker userMarker() {
      return Marker(
        markerId: MarkerId('userMarker'),
        position: LatLng(lat, long),
        icon: BitmapDescriptor.defaultMarkerWithHue(20.0),
        infoWindow: InfoWindow(title: 'คุณอยู่ตรงนี้'),
      );
    }

    Set<Marker> mySet() {
      return <Marker>[userMarker()].toSet();
    }

    return Container(
      height: screen * 0.8,
      color: Colors.grey,
      margin: EdgeInsets.all(5),
      child: lat == null
          ? Center(child: CircularProgressIndicator())
          : GoogleMap(
              initialCameraPosition: position,
              mapType: MapType.normal,
              onMapCreated: (controller) {},
              markers: mySet(),
            ),
    );
  }

  Container netwrokImge() {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 20, 30, 10),
      height: screen * 0.55,
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.cover, image: NetworkImage(widget.garageModels.gImage)),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
    );
  }

  Container changeImage() => Container(
      width: screen * 0.15,
      height: screen * 0.15,
      child: RaisedButton(
        child: Icon(
          Icons.add_photo_alternate_outlined,
          color: Colors.white,
          size: screen * 0.05,
        ),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        color: Colors.grey[400],
        onPressed: () => chooseImage(ImageSource.gallery),
      ));

  InputDecoration textborderside(String hint) {
    return InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(borderSide: BorderSide.none));
  }

  BoxDecoration bgInput() {
    return BoxDecoration(
      color: Colors.white,
      border: Border.all(width: 0, color: Colors.white),
      borderRadius: const BorderRadius.all(const Radius.circular(15)),
    );
  }

  Text text(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 20),
    );
  }

  _pickTime() async {
    TimeOfDay t;
    t = await showTimePicker(context: context, initialTime: opentime);
    if (t != null)
      setState(() {
        opentime = t;
        // got = '${t.hour}:${t.minute}';
        // print(got);
      });
  }

  _pickTime2() async {
    TimeOfDay t2;
    t2 = await showTimePicker(context: context, initialTime: closetime);

    if (t2 != null)
      setState(() {
        closetime = t2;
        // gct = '${t2.hour}:${t2.minute}';
        // print(gct);
      });
  }

  Uri uri = Uri.parse("http://139.59.229.66:5002/api/Garage/UpdateGarage");
  Future<Map<dynamic, dynamic>> updateG(
      String name,
      String des,
      String phonNO,
      String gd,
      String gopT,
      String gcT,
      String lat,
      String long,
      String gC,
      String gst) async {
    final imageUpload = http.MultipartRequest('PUT', uri);

    imageUpload.headers.addAll({
      'Content-Type': 'multipart/form-data',
      'Accept-Encoding-Type': 'gzip, deflate, br',
      'Accept-': '*/*',
    });
    print(file1);
    print(img);
    print(name);
    print(des);
    print(phonNO);
    print(gd);
    print(lat);
    print(long);
    print(gC);
    print(gst);
    print(gopT);
    print(gcT);
    imageUpload.fields['G_Image'] = baseImg;
    imageUpload.fields['G_Name'] = name;
    imageUpload.fields['G_Description'] = des;
    imageUpload.fields['G_Phone'] = phonNO;
    imageUpload.fields['G_Date'] = gd;
    imageUpload.fields['G_Latitude'] = lat;
    imageUpload.fields['G_Longitude'] = long;
    imageUpload.fields['G_charge'] = gC;
    imageUpload.fields['G_Service_Type'] = gst;
    imageUpload.files.add(file1);
    imageUpload.fields['G_Open_Time'] = gopT;
    imageUpload.fields['G_Close_Time'] = gcT;
    imageUpload.fields['G_Id'] = widget.garageModels.gId.toString();
    imageUpload.fields['UId'] = widget.garageModels.uId.toString();

    try {
      final streamedResponse = await imageUpload.send();
      final response = await http.Response.fromStream(streamedResponse);
      if (response.statusCode != 200) {
        print(response);
      }
      print(response.body);
      Map<String, dynamic> reponseData = {"success": '${response.body}'};
      return reponseData;
    } catch (e) {
      print(e);
      return null;
    }
  }

  void _startdate() async {
    final Map<String, dynamic> response = await updateG(name, des, phonNO, gd,
        gopT, gcT, lat.toString(), long.toString(), gC, gst);
    print(response);
    if (response == null) {
      normalDialog(context, 'ล้มเหลว', 'แก้ไขข้อมูลล้มเหลว ลองใหม่อีกครั้ง',5);
    } else {
      normalDialog(context, 'สำเร็จ', 'แก้ไขข้อมูลอู่เรียบร้อย',5);
      Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyGarge(
                                uid: widget.uid,
                                name: widget.name,
                              )));
    }
  }
}
