import 'dart:convert';
import 'package:http/http.dart' as http;


class CarInfoModel{
  final int cid;
  final String brand;
  final String image;
  final DateTime egine;
  final DateTime battery;
  final DateTime coolant;
  final DateTime fuel;
  final DateTime airconditioning;
  final DateTime powertrain;
  final DateTime braking;
  final DateTime tires;
  final DateTime steering;
  final int uid;
  final String fileImage;

  CarInfoModel({
    this.cid,
    this.brand,
    this.image,
    this.egine,
    this.battery,
    this.coolant,
    this.fuel,
    this.airconditioning,
    this.powertrain,
    this.braking,
    this.tires,
    this.steering,
    this.uid,
    this.fileImage
  });

  factory CarInfoModel.fromJson(Map<String ,dynamic> json){

    return CarInfoModel(
      cid: json['c_Id'],
      brand: json['c_Brand'],
      image: json['c_Image'],
      egine: json['c_Engine'],
      battery: json['c_Battery'],
      coolant: json['c_Coolant'],
      fuel: json['c_Fuel'],
      airconditioning: json['c_AirConditioning'],
      powertrain: json['c_PowerTrain'],
      braking: json['c_Braking'],
      tires: json['c_Tires'],
      steering: json['c_Steering'],
      uid: json['uId'],
      fileImage: json['fileImage']
    );
  }
}

  Future<List<CarInfoModel>> fetchGarageDetail() async{
    final response = await http.get('http://139.59.229.66:5002/api/CarInfo/GetCar?cid=');

    if(response.statusCode == 200) {
      Iterable l = json.decode(response.body);
      List<CarInfoModel> carinfomodles = l.map((g) => CarInfoModel.fromJson(g)).toList();

      return carinfomodles;
    }else{
      throw Exception('Failed to load MarKer');
    } 
  }