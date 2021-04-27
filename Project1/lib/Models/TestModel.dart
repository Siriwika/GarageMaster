// To parse this JSON data, do
//
//     final garageModel = garageModelFromJson(jsonString);

import 'dart:convert';
import 'package:http/http.dart' as http;

List<GarageModel> garageModelFromJson(String str) => List<GarageModel>.from(json.decode(str).map((x) => GarageModel.fromJson(x)));

String garageModelToJson(List<GarageModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GarageModel {
    GarageModel({
        this.gId,
        this.gImage,
        this.gName,
        this.gDescription,
        this.gPhone,
        this.gDate,
        this.gOpenTime,
        this.gCloseTime,
        this.gLatitude,
        this.gLongitude,
        this.gCharge,
        this.gServiceType,
        this.uId,
        this.sId,
        this.fileImage,
        this.km,
    });

    int gId;
    String gImage;
    String gName;
    String gDescription;
    String gPhone;
    String gDate;
    DateTime gOpenTime;
    DateTime gCloseTime;
    double gLatitude;
    double gLongitude;
    int gCharge;
    String gServiceType;
    int uId;
    int sId;
    dynamic fileImage;
    double km;


    factory GarageModel.fromJson(Map<String, dynamic> json) => GarageModel(
        gId: json["g_Id"] == null ? null : json["g_Id"],
        gImage: json["g_Image"] == null ? null : json["g_Image"],
        gName: json["g_Name"] == null ? null : json["g_Name"],
        gDescription: json["g_Description"] == null ? null : json["g_Description"],
        gPhone: json["g_Phone"] == null ? null : json["g_Phone"],
        gDate: json["g_Date"] == null ? null : json["g_Date"],
        gOpenTime: json["g_Open_Time"] == null ? null : DateTime.parse(json["g_Open_Time"]),
        gCloseTime: json["g_Close_Time"] == null ? null : DateTime.parse(json["g_Close_Time"]),
        gLatitude: json["g_Latitude"] == null ? null : json["g_Latitude"].toDouble(),
        gLongitude: json["g_Longitude"] == null ? null : json["g_Longitude"].toDouble(),
        gCharge: json["g_charge"] == null ? null : json["g_charge"],
        gServiceType: json["g_Service_Type"] == null ? null : json["g_Service_Type"],
        uId: json["uId"] == null ? null : json["uId"],
        sId: json["sId"] == null ? null : json["sId"],
        fileImage: json["fileImage"],

    );

    Map<String, dynamic> toJson() => {
        "g_Id": gId == null ? null : gId,
        "g_Image": gImage == null ? null : gImage,
        "g_Name": gName == null ? null : gName,
        "g_Description": gDescription == null ? null : gDescription,
        "g_Phone": gPhone == null ? null : gPhone,
        "g_Date": gDate == null ? null : gDate,
        "g_Open_Time": gOpenTime == null ? null : gOpenTime.toIso8601String(),
        "g_Close_Time": gCloseTime == null ? null : gCloseTime.toIso8601String(),
        "g_Latitude": gLatitude == null ? null : gLatitude,
        "g_Longitude": gLongitude == null ? null : gLongitude,
        "g_charge": gCharge == null ? null : gCharge,
        "g_Service_Type": gServiceType == null ? null : gServiceType,
        "uId": uId == null ? null : uId,
        "sId": sId == null ? null : sId,
        "fileImage": fileImage,
    };
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

List<ServiceModel> serviceModelFromJson(String str) => List<ServiceModel>.from(json.decode(str).map((x) => ServiceModel.fromJson(x)));

String serviceModelToJson(List<ServiceModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
class ServiceModel {
   ServiceModel({
        this.gId,
        this.sId,
        this.sname,
        this.typecarid,
    });

    int gId; 
    int sId;
    String sname;
    int typecarid;


    factory ServiceModel.fromJson(Map<String, dynamic> json) => ServiceModel(
        gId: json["g_Id"] == null ? null : json["g_Id"],
        sId: json["sId"] == null ? null : json["sId"],
        sname: json["sName"] == null ? null : json["sName"],
        typecarid: json["TC_Id"] == null ? null : json["TC_Id"],
    );

    Map<String, dynamic> toJson() => {
        "g_Id": gId == null ? null : gId,
        "sId": sId == null ? null : sId,
        "sName": sname == null ? null : sname,
        "TC_Id": typecarid == null ? null : typecarid,
    };
}


Future<List<ServiceModel>> fetchGarageservice(int gid) async {
 var endpointUrl = 'http://139.59.229.66:5002/api/Garage/GetServicebyGarage';
  var queryParams = {
    'gid': gid.toString(),
  };
  String queryString = Uri(queryParameters: queryParams).query;
  var requestUrl = endpointUrl +
      '?' +
      queryString; // result - http://139.59.229.66:5002/api/CarInfo/GetMyCar?uid=1
  var response = await http.get(requestUrl);
  if (response.statusCode == 200) {
    Iterable l = json.decode(response.body);
    List<ServiceModel> service =
        l.map((g) => ServiceModel.fromJson(g)).toList();

    return service;
  } else {
    throw Exception('Failed to load Service');
  }
}


Future<List<GarageModel>> fetchMygarage(int uid) async {
 var endpointUrl = 'http://139.59.229.66:5002/api/Garage/GetGaragebyId';
  var queryParams = {
    'uid': uid.toString(),
  };
  String queryString = Uri(queryParameters: queryParams).query;
  var requestUrl = endpointUrl +
      '?' +
      queryString; // result - http://139.59.229.66:5002/api/CarInfo/GetMyCar?uid=1
  var response = await http.get(requestUrl);
  if (response.statusCode == 200) {
    Iterable l = json.decode(response.body);
    List<GarageModel> garage =
        l.map((g) => GarageModel.fromJson(g)).toList();

    return garage;
  } else {
    throw Exception('Failed to load Service');
  }
}

Future<List<GarageModel>> fetchservice(int sid) async {
 var endpointUrl = 'http://139.59.229.66:5002/api/Garage/GetGarageByService';
  var queryParams = {
    'sid': sid.toString(),
  };
  String queryString = Uri(queryParameters: queryParams).query;
  var requestUrl = endpointUrl +
      '?' +
      queryString; // result - http://139.59.229.66:5002/api/CarInfo/GetMyCar?uid=1
  var response = await http.get(requestUrl);
  if (response.statusCode == 200) {
    Iterable l = json.decode(response.body);
    List<GarageModel> service =
        l.map((g) => GarageModel.fromJson(g)).toList();

    return service;
  } else {
    throw Exception('Failed to load Service');
  }
}