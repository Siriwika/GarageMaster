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
        backgroundColor: Color.fromRGBO(239, 113, 40, 1),
        body: SafeArea(
            child: Column(children: [
          Align(
            alignment: Alignment.centerRight,
            child: Container(
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
                color: Color.fromRGBO(251, 186, 110, 1),
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
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              margin: EdgeInsets.only(right: 10),
              child: Text(
                name,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
              width: 130,
              height: 50,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(251, 186, 110, 1),
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
                    return Center(child: CircularProgressIndicator());
                  }
                }),
          ),
          Center(
            child: Container(
              width: screen * 0.9,
              height: screen * 0.15,
              margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
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
            ),
          ),
          Container(
              alignment: Alignment.center,
              child: Container(
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
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  color: Color.fromRGBO(252, 207, 153, 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                ),
              )),
        ])));
  }
}
