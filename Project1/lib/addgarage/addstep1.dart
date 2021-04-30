import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:project1/addgarage/addstep2.dart';
import 'package:flutter/material.dart';
import 'package:project1/utility/dialog.dart';

main() {
  runApp(Garagestep1());
}

class Garagestep1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Garage Master",
        home: MyGarage1(
          uid: null,
          name: '',
        ),
        theme: ThemeData(fontFamily: 'Prompt'));
  }
}

class MyGarage1 extends StatefulWidget {
  final int uid;
  final String name;
  MyGarage1({Key key, this.uid, this.name}) : super(key: key);
  @override
  _MyGarage1State createState() => _MyGarage1State();
}

// Future<GarageModel> createGarage() async {}

class _MyGarage1State extends State<MyGarage1> {
  double screen;
  File file;
  String gName, gdescription;
  var image;
  final gNAMEcontroller = TextEditingController();
  final gDescriptioncontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    print('screen = $screen');
    return Scaffold(
        backgroundColor: Color.fromRGBO(239, 113, 40, 1),
        appBar: AppBar(
          title: Text(
            'เริ่มสร้างอู่',
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
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  child: Center(
                    child: ButtonTheme(
                      minWidth: screen * 0.9,
                      height: screen * 0.4,
                      child: file == null
                          ? addGarageButton()
                          : //Row(
                          //children: [

                          Image.file(
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
                            onChanged: (value) => gName = value.trim(),
                            controller: gNAMEcontroller,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                )),
                            textInputAction: TextInputAction.next,
                          ),
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
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(25)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextFormField(
                      onChanged: (value) => gdescription,
                      controller: gDescriptioncontroller,
                      keyboardType: TextInputType.multiline,
                      maxLines: 8,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                      textInputAction: TextInputAction.done,
                    ),
                  ),
                ),
                Container(
                  child: Center(child: nextbutton(context)),
                )
              ],
            ),
          ),
        ));
  }

  RaisedButton nextbutton(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      color: Colors.green,
      child: Text('ต่อไป',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          )),
      onPressed: () {
        if ((gName?.isEmpty ?? true) && (file == null)) {
          normalDialog(context, "คุณยังไม่ได้กรอกข้อมูล",
              "กรุณาเพิ่มรูปภาพอู่ และ ชื่อร้าน",5);
        } else if (gName?.isEmpty ?? true) {
          normalDialog(context, "คุณยังกรอกชื่อร้าน", "กรุณากรอกชื่อร้าน",5);
        } else if (file == null) {
          normalDialog(context, "คุณยังเพิ่มรูปภาพอู่", "กรุณาเพิ่มรูปภาพอู่",5);
        } else {
          String gDes = gDescriptioncontroller.text;
          String gN = gNAMEcontroller.text;
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return MyGarage2(
                name: widget.name,
                gdescription: gDes,
                gName: gN,
                image: file,
                uid: widget.uid,
              );
            },
          ));
        }
      },
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

  Widget addGarageButton() {
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
