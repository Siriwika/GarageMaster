import 'dart:convert';
import 'package:Project1/Models/CarinfoModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DataPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class DataPage extends StatefulWidget {
  DataPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DataPageState createState() => _DataPageState();
}


class _DataPageState extends State<DataPage> {  

  final String url = 'http://139.59.229.66:5002/api/CarInfo/GetCar?cid=1';

  List<CarInfoModel> myAllData = [];

  @override
  // ignore: must_call_super
  void initState() {
    getapi();
  }

  Future getapi() async {
    http.Response response = await http.get(url,headers: {'Accept' : 'Application/json'});
    if (response.statusCode == 200) {
      String responseBody = response.body;
      var jsonBody = json.decode(responseBody);
      for (var json in jsonBody) {
        myAllData.add(new CarInfoModel (
          cid: json['c_Id'], brand: json['c_Brand'], image: json['c_Image']));
      }
        setState(() {});
        myAllData.forEach((someData) => print('cid : ${someData.cid}'));
    } else {
      print('Failed to load MarKer');
    }
  }


  @override
  Widget build(BuildContext context) {
   return Scaffold(
   appBar: AppBar(
   title: Text('Testdata'),
   ),
       body:  myAllData.length == 0
       ? new Center(
         child: new CircularProgressIndicator(),
       )
       : showcarinfo(),
    );
  }

   Widget showcarinfo() {
     return new ListView.builder(
       itemCount: myAllData.length,
       itemBuilder: (_, index) {
         return new Container(
           child: new Card(
             child: new Container(
               child: Column(
                 children: <Widget> [
                  //  new Text('image : ${myAllData[index].image}'),
                    new Text('id : ${myAllData[index].cid}'),
                  //  new Text('brand : ${myAllData[index].brand}'),
                   ],
               ),
             ),
           ),
           );
       });
   }
}