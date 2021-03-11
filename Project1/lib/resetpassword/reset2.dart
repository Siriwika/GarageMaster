import 'package:flutter/material.dart';

// ignore: camel_case_types
class resetpassword2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: reset2(),
      theme: ThemeData(fontFamily: 'Prompt'),
    );
  }
}

// ignore: camel_case_types
class reset2 extends StatefulWidget {
  @override
  _reset2State createState() => _reset2State();
}

// ignore: camel_case_types
class _reset2State extends State<reset2> {
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
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: screen * 0.2,
                    ),
                    Text(
                      'ลืมรหัสผ่าน',
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    SizedBox(
                      height: screen * 0.05,
                    ),
                    Text(
                      'กรุณากรอกอีเมล',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    SizedBox(
                      height: screen * 0.05,
                    ),
                    SizedBox(
                      width: screen * 0.7,
                      child: Container(
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
                    ),
                    SizedBox(
                      height: screen * 0.05,
                    ),
                    Container()
                  ],
                ),
              ),
            ))
          ],
        )));
  }
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
      hintText: hint, border: OutlineInputBorder(borderSide: BorderSide.none));
}
