import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project1/Models/TestModel.dart';
import 'package:project1/main.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/cupertino.dart';

class Garage extends StatefulWidget {
  final GarageModel garageModels;
  Garage(this.garageModels);

  @override
  _GarageState createState() => _GarageState();
}

class GaragePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Garage Master",
        theme: ThemeData(fontFamily: 'Prompt'));
  }
}

class _GarageState extends State<Garage> {

  Future<List<ServiceModel>> futureservice;
  List<ServiceModel> garagevalues;
  Set<Row> garage = Set<Row>();
  
  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() { 
    super.initState();
    futureservice = fetchGarageservice(gid);
  }
  

  String format(double n) {
  return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 2);
  }

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

  @override
  Widget build(BuildContext context) {
    charge = widget.garageModels.gCharge;
    screen = MediaQuery.of(context).size.width;
    call = widget.garageModels.gPhone;
    opentime = TimeOfDay.fromDateTime(DateTime.parse((widget.garageModels.gOpenTime).toString())); 
    closetime = TimeOfDay.fromDateTime(DateTime.parse((widget.garageModels.gCloseTime).toString())); 
    distkm = format(widget.garageModels.km);
    gid = widget.garageModels.gId;

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
                        image: NetworkImage(widget.garageModels.gImage)),
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
                          widget.garageModels.gName,
                          style: TextStyle(color: Colors.green, fontSize: 20),
                        ),
                        Text(
                          widget.garageModels.gDescription,
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                        Text(
                          'เวลาเปิดให้บริการ',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                        Text(
                          'ตั้งแต่: ${opentime.hour}:${opentime.minute}{$opentime.} - ${closetime.hour}:${closetime.minute} น.',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                        Text(
                          'ค่าบริการเริ่มต้น $charge บาท',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                        Text('$distkm กม.',
                          style: TextStyle(color: Colors.white, fontSize: 16),
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

                      for (int i = 0; i < garagevalues.length; i++) {
                        garage.add(
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: getList()[
                          Row(
                            children: [
                              Icon(
                                Icons.done,
                                color: Colors.green,
                                size: 30,
                              ),
                              Text(garagevalues[i].sname,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              ),
                            ],
                          )]
                         
                      ),
                          ),
                        ]

                      ),
            )))
          },
        ),
            ))
      )
    )
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: FutureBuilder<List<ServiceModel>>(
          future: futureservice,
          builder: (context, value) {
            if (value.hasData) {
             garagevalues = value.data;
              return Container(
                  garage: garage);
            } else if (value.hasError) {
              return Text(value.error);
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
        )
          ;
}