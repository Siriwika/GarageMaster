import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project1/main.dart';
import 'package:project1/registerpage.dart';
import 'package:project1/resetpassword/reset1.dart';
import 'package:project1/%E0%B8%B5%E0%B8%B5utility/dialog.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp1());
}

class MyApp1 extends StatelessWidget {
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
  String email, password;
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
            emailuser(),
            SizedBox(
              height: screen * 0.09,
            ),
            pwuser(),
            SizedBox(
              height: screen * 0.09,
            ),
            Container(
              height: 40,
              width: screen * 0.5,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(251, 186, 110, 1),
                  borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                onPressed: () {
                  print('email = $email, password = $password');
                  if ((email?.isEmpty ?? true) || (password?.isEmpty ?? true)) {
                    // print('Have Space');
                    normalDialog(
                        context, 'Have Space ?', 'Please Fill Every Blank');
                  } else {}
                  /*signInWithGoogle().then((result) {
                    if (result != null) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return ProfilePage();
                          },
                        ),
                      );
                    }
                  });*/
                },
                child: Text(
                  'ล็อกอิน',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            googlelogin(context),
            SizedBox(
              height: 50,
            ),
            /* resetpw(context),
            SizedBox(
              height: 50,
            ),*/
            userregister(context),
          ],
        ),
      ),
    );
  }

  FlatButton userregister(BuildContext context) {
    return FlatButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Register()));
        //TODO FORGOT PASSWORD SCREEN GOES HERE
      },
      child: Text(
        'ยังไม่มีบัญชีใช่หรือไม่? ลงทะเบียน',
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }

  FlatButton resetpw(BuildContext context) {
    return FlatButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => resetpassword1()));
      },
      child: Text(
        'ลืมรหัสผ่าน',
        style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            decoration: TextDecoration.underline),
      ),
    );
  }

  Padding pwuser() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40),
      //padding: EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        height: screen * 0.13,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 0.0, color: Colors.white),
          borderRadius: const BorderRadius.all(const Radius.circular(15)),
        ),
        padding: const EdgeInsets.only(left: 3, top: 3),
        child: TextField(
          onChanged: (value) => password = value.trim(),
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
    );
  }

  Padding emailuser() {
    return Padding(
      //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Container(
        height: screen * 0.13,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 0.0, color: Colors.white),
          borderRadius: const BorderRadius.all(const Radius.circular(15)),
        ),
        padding: const EdgeInsets.only(left: 3, top: 3),
        child: TextField(
          onChanged: (value) => email = value.trim(),
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            icon: Icon(Icons.person),
            border: OutlineInputBorder(borderSide: BorderSide.none),
            labelText: 'อีเมล',
            hintText: 'abc@gmail.com',
          ),
        ),
      ),
    );
  }

  Container googlelogin(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      child: SignInButton(
        Buttons.GoogleDark,
        onPressed: () => processSingInWithGooggle()
        /* {
          signInWithGoogle().then((result) {
            if (result != null) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return HomePage();
                  },
                ),
              );
            }
          });
        
        }*/
        ,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    );
  }

  Future<Null> processSingInWithGooggle() async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );

    await Firebase.initializeApp().then((value) async {
      await _googleSignIn.signIn().then((value) async {
        //ดึงค่าจาก googleชื่อ และอีเมล
        String name = value.displayName;
        String email = value.email;
        print('Login With Google success value Name = $name,email = $email');
        await value.authentication.then((value2) async {
          AuthCredential authCredential = GoogleAuthProvider.credential(
            idToken: value2.idToken,
            accessToken: value2.accessToken,
          );
          await FirebaseAuth.instance
              .signInWithCredential(authCredential)
              .then((value3) {
            String uid = value3.user.uid;
            print('uid = $uid');
          });
        });
        runApp(MyMap());
      });
    });
  }

  Future<Null> registerFirebase() async {
    await Firebase.initializeApp().then((value) {
      print('fire initialize success');
    });
  }
}
