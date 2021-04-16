import 'package:project1/registerpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project1/resetpassword/reset1.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project1/sign_in.dart';
import 'package:project1/tab/profile.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
          future: _fbApp,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print('You have an error! ${snapshot.error.toString()}');
              return Text('Something went wrong!');
            } else if (snapshot.hasData) {
              return Login();
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
      theme: ThemeData(fontFamily: 'Prompt', backgroundColor: Colors.black),
    );
  }
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  double screen;
  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    print('screen = $screen');
    return Scaffold(
      backgroundColor: Color.fromRGBO(239, 113, 40, 1),
      // backgroundColor: Colors.deepOrange[400],
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 150.0),
              child: Center(
                child: Container(
                    width: 200,
                    height: 150,
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Text(
                      'ล็อกอิน',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    )),
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Container(
                height: screen * 0.13,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 0.0, color: Colors.white),
                  borderRadius:
                      const BorderRadius.all(const Radius.circular(15)),
                ),
                padding: const EdgeInsets.only(left: 3, top: 3),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    labelText: 'อีเมล',
                    hintText: 'กรุณาป้อนอีเมล ตัวอย่าง abc@gmail.com',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: screen * 0.09,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: screen * 0.13,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 0.0, color: Colors.white),
                  borderRadius:
                      const BorderRadius.all(const Radius.circular(15)),
                ),
                padding: const EdgeInsets.only(left: 3, top: 3),
                child: TextField(
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  obscureText: true,
                  decoration: InputDecoration(
                      icon: Icon(Icons.vpn_key_sharp),
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      labelText: 'รหัสผ่าน',
                      hintText: 'กรุณาป้อนรหัสผ่าน'),
                ),
              ),
            ),
            SizedBox(
              height: screen * 0.09,
            ),
            Container(
              height: 40,
              width: 150,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(251, 186, 110, 1),
                  borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                onPressed: () {
                  signInWithGoogle().then((result) {
                    if (result != null) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return ProfilePage();
                          },
                        ),
                      );
                    }
                  });
                },
                child: Text(
                  'ล็อกอิน',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => resetpassword1()));
              },
              child: Text(
                'ลืมรหัสผ่าน',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    decoration: TextDecoration.underline),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Register()));
              },
              child: Text(
                'ยังไม่มีบัญชีใช่หรือไม่? ลงทะเบียน',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
