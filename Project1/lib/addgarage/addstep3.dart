import 'package:flutter/material.dart';

void main() {
  runApp(Garagestep3());
}

class Garagestep3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyGarage3(),
      theme: ThemeData(fontFamily: 'Prompt'),
    );
  }
}

class MyGarage3 extends StatefulWidget {
  @override
  _MyGarage3State createState() => _MyGarage3State();
}

class _MyGarage3State extends State<MyGarage3> {
  bool carCheck = false;
  bool motercycleCheck = false;
  double screen;
  List selectService = <dynamic>[];
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
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    child: text('บริการของอู่'),
                  ),
                ),
                Row(
                  children: [ ],
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: text('บริการพิเศษ(ถ้ามี)')),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Radio(
                            value: 'มีรถยก',
                            groupValue: selectService,
                            onChanged: (value) {
                              setState(() {
                                selectService = value;
                              });
                            }),
                        Text('มีรถยก')
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: 'เช็คฟรี',
                            groupValue: selectService,
                            onChanged: (value) {
                              setState(() {
                                selectService = value;
                              });
                            }),
                        Text('เช็คฟรี')
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    text('อื่นๆ'),
                    SizedBox(
                      width: screen * 0.6,
                      child: Container(
                        height: screen * 0.13,
                        decoration: bgInput(),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 6, top: 18),
                          child: Center(
                            child: TextField(
                              keyboardType: TextInputType.phone,
                              textInputAction: TextInputAction.next,
                              decoration:
                                  textborderside('เช่น มีที่นั่งสำหรับนั่งรอ'),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: screen * 0.1,
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
                    onPressed: () {},
                  )),
                )
              ],
            ),
          ))
        ],
      )),
    );
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
