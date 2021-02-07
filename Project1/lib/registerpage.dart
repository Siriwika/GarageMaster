import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(RegisterPage());
}

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Register(),
      theme: ThemeData(fontFamily: 'Prompt'),
    );
  }
}

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
          SizedBox(
            height: screen * 0.03,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      'ลงทะเบียน',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: screen * 0.03,
                  ),
                  text('อีเมล'),
                  Container(
                    height: screen * 0.13,
                    decoration: bgInput(),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 6, top: 18),
                      child: Center(
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.done,
                          decoration: textborderside('excemple@gmail.com'),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screen * 0.05,
                  ),
                  text('ชื่อผู้ใช้'),
                  Row(
                    children: [
                      SizedBox(
                        width: screen * 0.40,
                        child: Container(
                          height: screen * 0.13,
                          decoration: bgInput(),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6, top: 18),
                            child: Center(
                              child: TextField(
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration: textborderside('ชื่อ'),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: screen * 0.04,
                      ),
                      SizedBox(
                        width: screen * 0.4,
                        child: Container(
                          height: screen * 0.13,
                          decoration: bgInput(),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6, top: 18),
                            child: Center(
                              child: TextField(
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration: textborderside('นามสกุล'),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: screen * 0.05,
                  ),
                  text('รหัสผ่าน'),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      width: screen * 0.7,
                      child: Container(
                        height: screen * 0.13,
                        decoration: bgInput(),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 6, top: 18),
                          child: Center(
                            child: TextField(
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              decoration: textborderside(''),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    child: Text(
                        'ใช้อักขระ 8 ตัวขึ้นไปที่มีทั้งตัวอักษร ตัวเลข และสัญลักษณ์ผสมกัน'),
                  ),
                  text('ยืนยันรหัสผ่าน'),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      width: screen * 0.7,
                      child: Container(
                        height: screen * 0.13,
                        decoration: bgInput(),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 6, top: 18),
                          child: Center(
                            child: TextField(
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.done,
                              decoration: textborderside(''),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screen * 0.08,
                  ),
                  Container(
                    child: Center(
                        child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      color: Color.fromRGBO(251, 186, 110, 1),
                      child: Text('ลงทะเบียน',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          )),
                      onPressed: () {},
                    )),
                  )
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }

  Align text(String data) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Text(
          data,
          style: TextStyle(color: Colors.white, fontSize: 15),
        ));
  }

  BoxDecoration bgInput() {
    return BoxDecoration(
      color: Colors.white,
      border: Border.all(width: 0, color: Colors.white),
      borderRadius: const BorderRadius.all(const Radius.circular(15)),
    );
  }

  InputDecoration textborderside(String hint) {
    return InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(borderSide: BorderSide.none));
  }
}
