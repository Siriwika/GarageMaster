import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:project1/Models/CarinfoModel.dart';
import 'package:project1/addgarage/mygarage.dart';
import 'package:project1/login.dart';
import 'package:project1/maintain/carinfo.dart';
import 'package:project1/maintain/mycarinfo.dart';
import 'package:project1/sign_in.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Profile(
        uid: null,
        name: '',
      ),
      theme: ThemeData(fontFamily: 'Prompt'),
    );
  }
}

class Profile extends StatefulWidget {
  final int uid;
  final String name;
  Profile({Key key, this.uid, this.name}) : super(key: key);
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Future<List<CarModel>> fetchCar;
  List<CarModel> value;

  Color mainColor = Color.fromRGBO(239, 113, 40, 1);
  Color secondColor = Color.fromRGBO(251, 186, 110, 1);
  Color btnColor = Color(0xFFff955b);
  Color editorColor = Color(0xFF4044cc);

  void setcar(int id) {
    super.initState();
    fetchCar = fetchCarDetail(id);
  }

  Future<void> _setcar(int id) {
    if (id != null) {
      fetchCar = fetchCarDetail(id);
      return fetchCar;
    } else {
      throw 'cannot get car';
    }
  }

  Future<String> getJsonFile(String path) async {
    return await rootBundle.loadString(path);
  }

  Future<void> _signOutGoogle() async {
    await googleSignIn.signOut();
    print("User Signed Out");
  }

  int id;
  double screen;
  String name;
  @override
  Widget build(BuildContext context) {
    id = widget.uid;
    name = widget.name;
    setState(() {
      _setcar(id);
    });
    screen = MediaQuery.of(context).size.width;
    print('screen = $screen');
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: mainColor,
          title: Text("รถของฉัน"),
        ),
        body: SafeArea(
            child: Column(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyGarge(
                                  uid: id,
                                  name: widget.name,
                                )));
                  },
                  color: mainColor,
                  child: Text(
                    'อู่ของฉัน >',
                    style: TextStyle(color: Colors.white),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          bottomLeft: Radius.circular(15))),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(205, 0, 0, 0),
                child: Text(
                  name,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
              width: 130,
              height: 50,
              decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(15))),
              child: Center(
                child: Text(
                  'รถของฉัน',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
          ),
          Container(
              alignment: Alignment.center,
              child: Container(
                width: screen * 0.9,
                height: screen * 0.15,
                margin: EdgeInsets.fromLTRB(0, 20, 0, 30),
                child: RaisedButton(
                  color: Color.fromRGBO(196, 196, 196, 1),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CarInfo1(
                                  uid: id,
                                  name: name,
                                )));
                  },
                  child: Icon(Icons.add, size: 40, color: Colors.white),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                ),
              )),
          SizedBox(
            height: 2,
          ),
          Expanded(
            child: FutureBuilder<List<CarModel>>(
                future: fetchCar,
                builder: (context, carData) {
                  if (carData.hasError) {
                    return Text(carData.error);
                  } else if (carData.hasData) {
                    value = carData.data;
                    print(value);
                    return ListView.builder(
                      itemCount: carData.data.length,
                      itemBuilder: (context, index) {
                        String brand = value[index].cBrand.toString();
                        String url = value[index].cImage.toString();
                        return Card(
                          child: Column(children: <Widget>[
                            ListTile(
                                leading: CircleAvatar(
                                    radius: 30,
                                    backgroundImage:
                                        NetworkImage(url, scale: 1.0)),
                                title: Text(brand),
                                trailing: Icon(Icons.keyboard_arrow_right),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Detail(value[index])));
                                }),
                          ]),
                        );
                      },
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                }),
          ),
          Container(
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 5, 5, 40),
                    width: screen * 0.7,
                    height: screen * 0.15,
                    child: RaisedButton(
                      onPressed: () {
                        _signOutGoogle();
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => MyApp1()));
                      },
                      child: Text(
                        'Sign Out',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      color: Color.fromRGBO(252, 207, 153, 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                    ),
                  )
                ],
              )),
        ])));
  }
}

