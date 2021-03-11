import 'package:flutter/material.dart';



class Garage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Garage Master",
        home: MyGarage2(),
        theme: ThemeData(fontFamily: 'Prompt'));
  }
}

class MyGarage2 extends StatefulWidget {
  MyGarage2({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyGaragePage2 createState() => _MyGaragePage2();
}

class _MyGaragePage2 extends State<MyGarage2> {
  List<DropdownMenuItem<String>> listDrop = [];
  String selected;

  DateTime pickedDate;
  TimeOfDay time;
  TimeOfDay time2;

  @override
  void initState() {
    super.initState();
    pickedDate = DateTime.now();
    time = TimeOfDay.now();
    time2 = TimeOfDay.now();
  }

  void loadData() {
    listDrop = [];
    listDrop.add(DropdownMenuItem(
      child: Text('ไปหาถึงที่ได้'),
      value: "1",
    ));
    listDrop.add(DropdownMenuItem(
      child: Text('เฉพาะที่อู่เท่านั้น'),
      value: "2",
    ));
  }

  double screen;
  int _value = 1;
  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    print('screen = $screen');
    loadData();
    return Scaffold(
        backgroundColor: Color.fromRGBO(239, 113, 40, 1),
        body: SafeArea(
            child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(15.0),
                child: Column(children: <Widget>[
                  SizedBox(
                    height: screen * 0.15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: screen * 0.3,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: text('เบอร์โทร'),
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
                                keyboardType: TextInputType.phone,
                                textInputAction: TextInputAction.next,
                                decoration: textborderside('0XX-XXX-XXXX'),
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
                  Align(alignment: Alignment.topLeft, child: text('เวลาทำการ')),
                  ListTile(
                    title: Text(
                      'วัน: ${pickedDate.day}/${pickedDate.month}/${pickedDate.year}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    trailing: Icon(Icons.keyboard_arrow_down),
                    onTap: _pickDate,
                  ),
                  ListTile(
                    title: Text(
                      'ตั้งแต่: ${time.hour}:${time.minute}น.',
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
                      'ถึง: ${time2.hour}:${time2.minute}น.',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    trailing: Icon(Icons.keyboard_arrow_down),
                    onTap: _pickTime,
                  ),
                  Row(
                    children: [
                      SizedBox(
                          width: screen * 0.3,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Align(
                                alignment: Alignment.centerRight,
                                child: text('ที่ตั้ง  ')),
                          )),
                      Expanded(
                        child: Container(
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: IconButton(
                                  icon: Icon(
                                    Icons.place,
                                    size: 40,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {})),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screen * 0.02,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: screen * 0.4,
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: text('ค่าบริการเริ่มต้น')),
                      ),
                      Expanded(
                        child: Container(
                          height: screen * 0.13,
                          decoration: bgInput(),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6, top: 18),
                            child: Center(
                              child: TextField(
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.done,
                                decoration: textborderside(''),
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
                                alignment: Alignment.centerLeft,
                                child: text('บาท')),
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
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: text('รูปแบบบริการ')),
                      ),
                      SizedBox(
                        width: screen * 0.36,
                        child: Container(
                          decoration: bgInput(),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: DropdownButton(
                                value: _value,
                                items: [
                                  DropdownMenuItem(
                                    child: Text("เฉพาะที่อู่เท่านั้น"),
                                    value: 1,
                                  ),
                                  DropdownMenuItem(
                                    child: Text("ไปหาถึงที่ได้"),
                                    value: 2,
                                  )
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    _value = value;
                                  });
                                }),
                          ),
                        ),
                      ),
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
                      child: Text('ต่อไป',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          )),
                      onPressed: () {},
                    )),
                  )
                ]),
              ),
            ),
          ],
        )));
  }

  _pickDate() async {
    DateTime date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDate: pickedDate,
    );

    if (date != null)
      setState(() {
        pickedDate = date;
      });
  }

  _pickTime() async {
    TimeOfDay t, t2 = await showTimePicker(context: context, initialTime: time);
    if (t != null)
      setState(() {
        time = t;
      });
    if (t2 != null)
      setState(() {
        time2 = t2;
      });
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

  Text text(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 20),
    );
  }
}
