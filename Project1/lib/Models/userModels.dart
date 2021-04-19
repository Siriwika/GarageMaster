import 'dart:convert';
import 'package:http/http.dart' as http;

UserModel userModelFromjson(String str) => UserModel.fromJson(json.decode(str));
String userModelTojson(UserModel data) => json.encode(data.toJson());

class UserModel {
  final String email;
  final String name;
  final String uid;

  UserModel({this.email, this.name, this.uid});

  factory UserModel.fromJson(Map<String,dynamic> json) => UserModel(
        uid: json["UId"],
        email: json["U_Email"],
        name: json["UFullName"],
      );

  Map<String, dynamic> toJson() => {
        "UId": uid,
        "U_Email": email,
        "UFullName": name,
      };
}

Future<List<UserModel>> fetchuser() async {
  final response =
      await http.post('http://139.59.229.66:5002/api/Account/AddUser');

  if (response.statusCode == 200) {
    Iterable l = json.decode(response.body);
    List<UserModel> userModels =
        l.map((g) => UserModel.fromJson(g)).toList();

    return userModels;
  } else {
    throw Exception('Failed to load Marker');
  }
}