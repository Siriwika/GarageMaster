import 'package:flutter/material.dart';


class GaragePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Garage Master",
        home: Garage(),
        theme: ThemeData(fontFamily: 'Prompt'));
  }
}

class Garage extends StatefulWidget {
  @override
  _GarageState createState() => _GarageState();
}

class _GarageState extends State<Garage> {
  double screen;
  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    print('screen = $screen');
    return Scaffold(
      backgroundColor: Color.fromRGBO(251, 186, 110, 1),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                  height: screen * 0.55,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://www.iamcar.net/wp-content/uploads/2017/07/%E0%B8%97%E0%B8%A3%E0%B8%B1%E0%B8%9E%E0%B8%A2%E0%B9%8C%E0%B8%A3%E0%B8%B8%E0%B9%88%E0%B8%87%E0%B9%80%E0%B8%A3%E0%B8%B7%E0%B8%AD%E0%B8%87%E0%B8%A2%E0%B8%B2%E0%B8%87%E0%B8%A2%E0%B8%99%E0%B8%95%E0%B9%8C.jpg')),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
                SizedBox(
                  height: screen * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'เปิด 10:00 - 18:00 น.',
                          style: TextStyle(color: Colors.green, fontSize: 20),
                        ),
                        Text(
                          'ร้านทรัพย์รุ่งเรือง',
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                        Text(
                          'ค่าบริการเริ่มต้น 500 บาท',
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                        Text(
                          'ไปหาถึงที่ได้',
                          style: TextStyle(color: Colors.green, fontSize: 18),
                        ),
                        Text(
                          '1.7 ก.ม.',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      ],
                    ),
                    ButtonTheme(
                      height: screen * 0.1,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 40,
                        ),
                        child: RaisedButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.call,
                                color: Colors.white,
                              ),
                              Text(
                                'โทรออก',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ],
                          ),
                          color: Color.fromRGBO(239, 113, 40, 1),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: screen * 0.05,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: screen * 0.02,
                    ),
                    Container(
                      width: screen * 0.2,
                      height: screen * 0.1,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          'มีรถยก',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: screen * 0.02,
                    ),
                    Container(
                      width: screen * 0.2,
                      height: screen * 0.1,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          'มีรถยก',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: screen * 0.02,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  color: Color.fromRGBO(252, 207, 153, 1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'บริการ',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.done,
                                color: Colors.green,
                                size: 30,
                              ),
                              Text(
                                'เครื่องยนต์',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.done,
                                color: Colors.green,
                                size: 30,
                              ),
                              Text(
                                'แบตเตอรี่',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.done,
                                color: Colors.green,
                                size: 30,
                              ),
                              Text(
                                'ช่วงล่าง',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.done,
                                color: Colors.green,
                                size: 30,
                              ),
                              Text(
                                'แก๊สรถยนต์',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: screen * 0.02,
                ),
                Text(
                    'ร้านทรัพย์รุ่งเรือง มีบริการซ่อม ตรวจเช็ครถยนต์  เปิดให้บริการทุกวัน ราคาคุยกันได้ครับ')
              ],
            ),
          ))
        ],
      )),
    );
  }
}
