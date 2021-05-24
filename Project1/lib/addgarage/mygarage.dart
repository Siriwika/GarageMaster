import 'package:flutter/services.dart';
import 'package:project1/Models/TestModel.dart';
import 'package:project1/addgarage/addstep1.dart';
import 'package:flutter/material.dart';
import 'package:project1/addgarage/detailgarage.dart';

class MyGaragePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyGarge(
        uid: null,
        name: '',
      ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Prompt'),
    );
  }
}

class MyGarge extends StatefulWidget {
  final int uid;
  final String name;
  MyGarge({Key key, this.uid, this.name});
  @override
  _MyGargeState createState() => _MyGargeState();
}

class _MyGargeState extends State<MyGarge> {
  Future<List<GarageModel>> fetchGarage;
  List<GarageModel> value;

  @override
  void initState() {
    super.initState();
    fetchGarage = fetchMygarage(widget.uid);
  }

  Future<String> getJsonFile(String path) async {
    return await rootBundle.loadString(path);
  }

  int id;
  double screen;
  @override
  Widget build(BuildContext context) {
    id = widget.uid;
    screen = MediaQuery.of(context).size.width;
    print('screen = $screen');
    return Scaffold(
        backgroundColor: Color.fromRGBO(239, 113, 40, 1),
        body: SafeArea(
            child: Column(
          children: [
            SizedBox(
              height: screen * 0.1,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                margin: EdgeInsets.only(right: 10),
                child: Text(
                  widget.name,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                width: 130,
                height: 50,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(251, 186, 110, 1),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15))),
                child: Center(
                  child: Text(
                    'อู่ของฉัน',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Prompt'),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Expanded(
              child: FutureBuilder<List<GarageModel>>(
                  future: fetchGarage,
                  builder: (context, garageData) {
                    if (garageData.hasError) {
                      return Text(garageData.error);
                    } else if (garageData.hasData) {
                      value = garageData.data;
                      print(value);
                      return ListView.builder(
                        itemCount: garageData.data.length,
                        itemBuilder: (context, index) {
                          String gname = value[index].gName.toString();
                          String url = value[index].gImage.toString();
                          return Card(
                            margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                            color: Color.fromRGBO(196, 196, 196, 1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                            child: Column(children: <Widget>[
                              ListTile(
                                  leading: CircleAvatar(
                                      radius: 25,
                                      backgroundImage:
                                          NetworkImage(url, scale: 1.0)),
                                  title: Text(gname),
                                  trailing: Icon(Icons.keyboard_arrow_right),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Garage2(
                                                value[index],
                                                widget.name,
                                                widget.uid)));
                                  }),
                            ]),
                          );
                        },
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  }),
            ),
            Align(
                alignment: Alignment.center,
                child: Container(
                  margin: EdgeInsets.fromLTRB(5, 5, 5, 420),
                  width: 350,
                  height: 60,
                  child: RaisedButton(
                    color: Color.fromRGBO(196, 196, 196, 1),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyGarage1(
                                    uid: id,
                                    name: widget.name,
                                  )));
                    },
                    child: Icon(Icons.add, size: 40, color: Colors.white),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                  ),
                ))
          ],
        )));
  }
}
