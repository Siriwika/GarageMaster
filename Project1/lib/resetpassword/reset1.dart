import 'package:flutter/material.dart';
import 'reset2.dart';

void main() {
  runApp(resetpassword1());
}

// ignore: camel_case_types
class resetpassword1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: reset1(),
      theme: ThemeData(fontFamily: 'Prompt'),
    );
  }
}

// ignore: camel_case_types
class reset1 extends StatefulWidget {
  @override
  _reset1State createState() => _reset1State();
}

// ignore: camel_case_types
class _reset1State extends State<reset1> {
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
                    Container(
                      child: nextButton(),
                    )
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

Widget nextButton() {
  return RaisedButton(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    color: Color.fromRGBO(251, 186, 110, 1),
    onPressed: () {},
    child: Text('ต่อไป',
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
        )),
  );
}
