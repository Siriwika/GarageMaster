import 'dart:convert';
import 'package:http/http.dart' as http;

UserModel userModelFromjson(String str) => UserModel.fromJson(json.decode(str));
String userModelTojson(UserModel data) => json.encode(data.toJson());

class UserModel {
  final String email;
  final String name;
  final int uid;

  UserModel({this.email, this.name, this.uid});

  factory UserModel.fromJson(Map<String,dynamic> json) => UserModel(
        uid: json["uId"],
        email: json["u_Email"],
        name: json["uFullName"],
      );

  Map<String, dynamic> toJson() => {
        "uId": uid,
        "u_Email": email,
        "uFullName": name,
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