import 'dart:convert';
import 'package:http/http.dart' as http;


class GarageModel {
  final int gid;
  final String name;
  final String description;
  final String phone;
  final String date;
  final String time;
  final double latitude;
  final double longitude;
  final int charge;
  final String servicetype;
  final int sid;
  final int uid;
  final Uri image;

  GarageModel(
      {this.gid,
      this.name,
      this.description,
      this.phone,
      this.date,
      this.time,
      this.latitude,
      this.longitude,
      this.charge,
      this.servicetype,
      this.sid,
      this.uid,
      this.image});

  factory GarageModel.fromJson(Map<dynamic, dynamic> json) {
    return GarageModel(
        gid: json['g_Id'],
        name: json['g_Name'],
        description: json['g_Description'],
        phone: json['g_Phone'],
        date: json['g_Date'],
        time: json['g_Open_Time'],
        latitude: json['g_Latitude'],
        longitude: json['g_Longitude'],
        charge: json['g_charge'],
        servicetype: json['g_Service_Type'],
        sid: json['sId'],
        uid: json['uId'],
        image: json['g_Image']);
  }
}

Future<List<GarageModel>> fetchGarageDetail() async {
  final response =
      await http.get('http://139.59.229.66:5002/api/Garage/GetGarage');

  if (response.statusCode == 200) {
    Iterable l = json.decode(response.body);
    List<GarageModel> garageModels =
        l.map((g) => GarageModel.fromJson(g)).toList();

    return garageModels;
  } else {
    throw Exception('Failed to load Marker');
  }
}
