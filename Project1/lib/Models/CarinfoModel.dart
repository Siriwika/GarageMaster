import 'dart:convert';
import 'package:http/http.dart' as http;
// To parse this JSON data, do

List<CarModel> carModelFromJson(String str) =>
    List<CarModel>.from(json.decode(str).map((x) => CarModel.fromJson(x)));

String carModelToJson(List<CarModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CarModel {
  CarModel({
    this.cId,
    this.cBrand,
    this.cImage,
    this.cEngine,
    this.cBattery,
    this.cCoolant,
    this.cFuel,
    this.cAirConditioning,
    this.cPowerTrain,
    this.cBraking,
    this.cTires,
    this.cSteering,
    this.uId,
    this.fileImage,
  });

  int cId;
  String cBrand;
  String cImage;
  DateTime cEngine;
  DateTime cBattery;
  DateTime cCoolant;
  DateTime cFuel;
  DateTime cAirConditioning;
  DateTime cPowerTrain;
  DateTime cBraking;
  DateTime cTires;
  DateTime cSteering;
  int uId;
  dynamic fileImage;

  factory CarModel.fromJson(Map<String, dynamic> json) => CarModel(
        cId: json["c_Id"] == null ? null : json["c_Id"],
        cBrand: json["c_Brand"] == null ? null : json["c_Brand"],
        cImage: json["c_Image"] == null ? null : json["c_Image"],
        cEngine:
            json["c_Engine"] == null ? null : DateTime.parse(json["c_Engine"]),
        cBattery: json["c_Battery"] == null
            ? null
            : DateTime.parse(json["c_Battery"]),
        cCoolant: json["c_Coolant"] == null
            ? null
            : DateTime.parse(json["c_Coolant"]),
        cFuel: json["c_Fuel"] == null ? null : DateTime.parse(json["c_Fuel"]),
        cAirConditioning: json["c_AirConditioning"] == null
            ? null
            : DateTime.parse(json["c_AirConditioning"]),
        cPowerTrain: json["c_PowerTrain"] == null
            ? null
            : DateTime.parse(json["c_PowerTrain"]),
        cBraking: json["c_Braking"] == null
            ? null
            : DateTime.parse(json["c_Braking"]),
        cTires:
            json["c_Tires"] == null ? null : DateTime.parse(json["c_Tires"]),
        cSteering: json["c_Steering"] == null
            ? null
            : DateTime.parse(json["c_Steering"]),
        uId: json["uId"] == null ? null : json["uId"],
        fileImage: json["fileImage"],
      );

  Map<String, dynamic> toJson() => {
        "c_Id": cId == null ? null : cId,
        "c_Brand": cBrand == null ? null : cBrand,
        "c_Image": cImage == null ? null : cImage,
        "c_Engine": cEngine == null ? null : cEngine.toIso8601String(),
        "c_Battery": cBattery == null ? null : cBattery.toIso8601String(),
        "c_Coolant": cCoolant == null ? null : cCoolant.toIso8601String(),
        "c_Fuel": cFuel == null ? null : cFuel.toIso8601String(),
        "c_AirConditioning": cAirConditioning == null
            ? null
            : cAirConditioning.toIso8601String(),
        "c_PowerTrain":
            cPowerTrain == null ? null : cPowerTrain.toIso8601String(),
        "c_Braking": cBraking == null ? null : cBraking.toIso8601String(),
        "c_Tires": cTires == null ? null : cTires.toIso8601String(),
        "c_Steering": cSteering == null ? null : cSteering.toIso8601String(),
        "uId": uId == null ? null : uId,
        "fileImage": fileImage,
      };
}

Future<List<CarModel>> fetchCarDetail(int uid) async {
  var endpointUrl = 'http://139.59.229.66:5002/api/CarInfo/GetCarByUId';
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
    List<CarModel> carModels = l.map((g) => CarModel.fromJson(g)).toList();
    return carModels;
  } else {
    throw Exception('Failed to load carinfo');
  }
}
