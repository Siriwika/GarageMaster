import 'dart:convert';
import 'package:http/http.dart' as http;

class UserModel {
  final String email;
  final String name;
  final String password;
  UserModel({
    required this.email,
    required this.name,
    required this.password,
  });

  UserModel copyWith({
    String? email,
    String? name,
    String? password,
  }) {
    return UserModel(
      email: email ?? this.email,
      name: name ?? this.name,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
      'password': password,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'],
      name: map['name'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  @override
  String toString() => 'UserModel(email: $email, name: $name, password: $password)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserModel &&
      other.email == email &&
      other.name == name &&
      other.password == password;
  }

  @override
  int get hashCode => email.hashCode ^ name.hashCode ^ password.hashCode;
}
