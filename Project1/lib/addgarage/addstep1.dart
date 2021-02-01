import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Garage Master",
      home: MyGarage(),
    );
  }
}

class MyGarage extends StatefulWidget {
  @override
  _MyGarageState createState() => _MyGarageState();
}

class _MyGarageState extends State<MyGarage> {
  double screen;

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
                fontSize: 30,
                color: Color.fromRGBO(0, 0, 0, 1),
                fontWeight: FontWeight.bold),
          ),
          backgroundColor: Color.fromRGBO(239, 113, 40, 1),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Container(
                  child: Center(
                    child: ButtonTheme(
                      minWidth: screen * 0.9,
                      height: screen * 0.4,
                      child: addGarageButton(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                    child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: screen * 0.2,
                      child: Expanded(
                        child: Text(
                          'ชื่อร้าน',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(width: 0.8, color: Colors.white),
                            borderRadius: const BorderRadius.all(
                                const Radius.circular(25)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: TextFormField(
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
                    ),
                  ],
                )),
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
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
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
                  child: Center(child: nextButton()),
                )
              ],
            ),
          ),
        ));
  }

  Widget addGarageButton() {
    return RaisedButton(
      child: Icon(
        Icons.add,
        color: Colors.white,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      color: Colors.grey[400],
      onPressed: () {},
    );
  }

  Widget nextButton() {
    return RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      color: Colors.green,
      child: Text('ต่อไป',
          style: TextStyle(
            color: Colors.white,
          )),
      onPressed: () {},
    );
  }
}
