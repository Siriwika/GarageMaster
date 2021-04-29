import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project1/Models/TestModel.dart';
import 'package:project1/addgarage/mygarage.dart';
import 'package:project1/editgarage/editgarage.dart';
import 'package:project1/editgarage/editservice.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/cupertino.dart';

class Garage2 extends StatefulWidget {
  final GarageModel garageModels;
  Garage2(this.garageModels);

  @override
  _Garage2State createState() => _Garage2State();
}

class GaragePage2 extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Garage Master",
        theme: ThemeData(fontFamily: 'Prompt'));
  }
}

class _Garage2State extends State<Garage2> {
  Future<List<ServiceModel>> futureservice;
  Future<Map<dynamic, dynamic>> futuregarage;
  List<ServiceModel> values;

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _getservice(int id) {
    if (id != null) {
      futureservice = fetchGarageservice(id);
      return futureservice;
    } else {
      throw 'cannot get service';
    }
  }

  Future<void> _deletegarage(int gid) {
    if (gid != null) {
      futuregarage = deletegarage(gid);
      return futuregarage;
    } else {
      throw 'cannot get service';
    }
  }

  // String format(double n) {
  //   return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 2);
  // }

  Future<String> getJsonFile(String path) async {
    return await rootBundle.loadString(path);
  }

  double screen;
  int charge;
  String call;
  TimeOfDay opentime;
  TimeOfDay closetime;
  String distkm;
  int gid;
  String service;

  @override
  Widget build(BuildContext context) {
    charge = widget.garageModels.gCharge;
    screen = MediaQuery.of(context).size.width;
    call = widget.garageModels.gPhone;
    opentime = TimeOfDay.fromDateTime(
        DateTime.parse((widget.garageModels.gOpenTime).toString()));
    closetime = TimeOfDay.fromDateTime(
        DateTime.parse((widget.garageModels.gCloseTime).toString()));
    // distkm = format(widget.garageModels.km);
    gid = widget.garageModels.gId;
    setState(() {
      _getservice(gid);
    });
    print('screen = $screen');
    return new Scaffold(
      backgroundColor: Color.fromRGBO(251, 186, 110, 1),
      body: SafeArea(
          child: Column(children: [
        Expanded(
            child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(20, 20, 30, 10),
              height: screen * 0.55,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(widget.garageModels.gImage)),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
            SizedBox(
              height: screen * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.garageModels.gName,
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.garageModels.gDescription,
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    Text(
                      'เวลาเปิดให้บริการ',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    Text(
                      'ตั้งแต่: ${opentime.hour}:${opentime.minute} ถึง ${closetime.hour}:${closetime.minute} น.',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    Text(
                      'ค่าบริการเริ่มต้น $charge บาท',
                      style: TextStyle(color: Colors.black, fontSize: 18),
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
                      onPressed: () {
                        setState(() {
                          _makePhoneCall('tel: $call');
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.call,
                            color: Colors.white,
                          ),
                          Text(
                            'โทรออก',
                            style: TextStyle(color: Colors.white, fontSize: 18),
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
                  width: screen * 0.4,
                  height: screen * 0.1,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      widget.garageModels.gServiceType,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: screen * 0.02,
            ),
            Expanded(
              child: FutureBuilder<List<ServiceModel>>(
                  future: futureservice,
                  builder: (context, serviceData) {
                    if (serviceData.hasError) {
                      return Text(serviceData.error);
                    } else if (serviceData.hasData) {
                      values = serviceData.data;
                      print(values);
                      return ListView.builder(
                        itemCount: serviceData.data.length,
                        itemBuilder: (context, index) {
                          String service = values[index].sname;
                          return ListTile(
                            tileColor: Color.fromRGBO(252, 207, 153, 1),
                            title: Text(
                              service,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    color: Colors.green,
                    child: Text('แก้ไขอู่',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        )),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  EditG(widget.garageModels)));
                    }),
                SizedBox(
                  width: screen * 0.03,
                ),
                RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    color: Colors.green,
                    child: Text('แก้บริการ',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        )),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  EditService(widget.garageModels)));
                    }),
                SizedBox(
                  width: screen * 0.03,
                ),
                RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    color: Colors.red,
                    child: Text('ลบอู่',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        )),
                    onPressed: () {
                      _deletegarage(gid);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MyGarge()));
                    }),
              ],
            ),
            SizedBox(
              height: screen * 0.02,
            ),
          ],
        )),
      ])),
    );
  }
}