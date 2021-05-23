import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project1/Models/userModels.dart';
import 'package:http/http.dart' as http;

import 'main.dart';

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

/*Future<UserModel> creatUser(String name, String email) async {
  final String apiUrl = " ";
  final response = await http.post(apiUrl, body: {
    "U_Email": email,
    "UFullName": name,
  });
}*/

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

// ignore: missing_return
Future<UserModel> createUser(String email, String name) async {
  final String apiUrl = "http://139.59.229.66:5002/api/Account/AddUser";
  final response =
      await http.post(apiUrl, body: {"U_Email": email, "UfullName": name});
  if (response.statusCode == 201) {
    final String responseString = response.body;
    return userModelFromjson(responseString);
  }
}

class _LoginState extends State<Login> {
  List<UserModel> user;
  List<UserModel> userModels;
  List<UserModel> userchack = [];
  String email;
  double screen;
  String email1, password;
  List<UserModel> _user;
  UserModel _regisToGbase;
  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    print('screen = $screen');
    return Scaffold(
      backgroundColor: Color.fromRGBO(239, 113, 40, 1),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 150.0),
              child: Center(
                child: Container(
                    width: 200,
                    height: 150,
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

            googlelogin(context),
            SizedBox(
              height: 50,
            ),
            /* resetpw(context),
            SizedBox(
              height: 50,
            ),*/
            // userregister(context),
          ],
        ),
      ),
    );
  }

  Container googlelogin(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      child: SignInButton(
        Buttons.Google,
        onPressed: () => processSingInWithGooggle(),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
        email = value.email;

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
        user = await regischeck(email);
        setState(() {
          _user = user;
          print(_user);
        });
        if (_user == null) {
          UserModel i = await createUser(name, email);
          print(i);
          setState(() {
            _regisToGbase = i;
          });
          _regisToGbase == null
              ? print('ไม่ผ่านจ้า')
              : HomePage(_regisToGbase.uid);
        } else {
          print(_user.first);
        }
      });
    });
  }

  Future<List<UserModel>> regischeck(String uEmail) async {
    //นำค่าเเป็น Params

    final String pramsUrl =
        "http://139.59.229.66:5002/api/Account/Login?email=${uEmail.toString()}";

    final res = await http.post(
      pramsUrl,
      body: {'email': uEmail},
    );

    if (res.statusCode == 200) {
      Iterable l = json.decode(res.body);
      userModels = l.map((g) => UserModel.fromJson(g)).toList();
      if (userModels.isEmpty) {
        return null;
      } else {
        return userModels;
      }
    } else {
      return null;
    }
  }

  Future<UserModel> createUser(String fName, String email) async {
    final String apiUrl = "http://139.59.229.66:5002/api/Account/AddUser";
    final bodyregis = jsonEncode({"uFullName": fName, "u_Email": email});
    final response = await http.post(apiUrl,
        body: bodyregis,
        headers: {'Content-Type': 'application/json', 'Accept': '*/*'});
    if (response.statusCode != 201) {
      return null;
    }

    final String responseString = response.body;
    print(responseString);
    return userModelFromjson(responseString);
  }

  Future<Null> registerFirebase() async {
    await Firebase.initializeApp().then((value) {
      print('fire initialize success');
    });
  }
}
