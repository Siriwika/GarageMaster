import 'dart:convert';
import 'package:http/http.dart' as http;

List<Carinfo> carinfoFromJson(String str) => List<Carinfo>.from(json.decode(str).map((x) => Carinfo.fromJson(x)));

String carinfoToJson(List<Carinfo> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Carinfo {
    Carinfo({
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

    factory Carinfo.fromJson(Map<String, dynamic> json) => Carinfo(
        cId: json["c_Id"],
        cBrand: json["c_Brand"],
        cImage: json["c_Image"],
        cEngine: DateTime.parse(json["c_Engine"]),
        cBattery: DateTime.parse(json["c_Battery"]),
        cCoolant: DateTime.parse(json["c_Coolant"]),
        cFuel: DateTime.parse(json["c_Fuel"]),
        cAirConditioning: DateTime.parse(json["c_AirConditioning"]),
        cPowerTrain: DateTime.parse(json["c_PowerTrain"]),
        cBraking: DateTime.parse(json["c_Braking"]),
        cTires: DateTime.parse(json["c_Tires"]),
        cSteering: DateTime.parse(json["c_Steering"]),
        uId: json["uId"],
        fileImage: json["fileImage"],
    );

    Map<String, dynamic> toJson() => {
        "c_Id": cId,
        "c_Brand": cBrand,
        "c_Image": cImage,
        "c_Engine": cEngine.toIso8601String(),
        "c_Battery": cBattery.toIso8601String(),
        "c_Coolant": cCoolant.toIso8601String(),
        "c_Fuel": cFuel.toIso8601String(),
        "c_AirConditioning": cAirConditioning.toIso8601String(),
        "c_PowerTrain": cPowerTrain.toIso8601String(),
        "c_Braking": cBraking.toIso8601String(),
        "c_Tires": cTires.toIso8601String(),
        "c_Steering": cSteering.toIso8601String(),
        "uId": uId,
        "fileImage": fileImage,
    };
}

Future<List<Carinfo>> fetchCarinfo() async {
  final response =
      await http.get('http://139.59.229.66:5002/api/CarInfo/GetCar?cid=1');

  if (response.statusCode == 200) {
    Iterable l = json.decode(response.body);
    List<Carinfo> carModels =
        l.map((g) => Carinfo.fromJson(g)).toList();

    return carModels;
  } else {
    throw Exception('Failed to load Marker');
  }
}