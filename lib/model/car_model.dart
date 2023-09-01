// To parse this JSON data, do
//
//     final carModel = carModelFromJson(jsonString);

import 'dart:convert';

List<CarModel> carModelFromJson(String str) =>
    List<CarModel>.from(json.decode(str).map((x) => CarModel.fromJson(x)));

String carModelToJson(List<CarModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CarModel {
  final int cityMpg;
  final String carModelClass;
  final int combinationMpg;
  final int cylinders;
  final double displacement;
  final Drive drive;
  final FuelType fuelType;
  final int highwayMpg;
  final String make;
  final String model;
  final Transmission transmission;
  final int year;

  CarModel({
    required this.cityMpg,
    required this.carModelClass,
    required this.combinationMpg,
    required this.cylinders,
    required this.displacement,
    required this.drive,
    required this.fuelType,
    required this.highwayMpg,
    required this.make,
    required this.model,
    required this.transmission,
    required this.year,
  });

  factory CarModel.fromJson(Map<String, dynamic> json) => CarModel(
        cityMpg: json["city_mpg"],
        carModelClass: json["class"],
        combinationMpg: json["combination_mpg"],
        cylinders: json["cylinders"],
        displacement: json["displacement"]?.toDouble(),
        drive: driveValues.map[json["drive"]]!,
        fuelType: fuelTypeValues.map[json["fuel_type"]]!,
        highwayMpg: json["highway_mpg"],
        make: json["make"],
        model: json["model"],
        transmission: transmissionValues.map[json["transmission"]]!,
        year: json["year"],
      );

  Map<String, dynamic> toJson() => {
        "city_mpg": cityMpg,
        "class": carModelClass,
        "combination_mpg": combinationMpg,
        "cylinders": cylinders,
        "displacement": displacement,
        "drive": driveValues.reverse[drive],
        "fuel_type": fuelTypeValues.reverse[fuelType],
        "highway_mpg": highwayMpg,
        "make": make,
        "model": model,
        "transmission": transmissionValues.reverse[transmission],
        "year": year,
      };
}

enum Drive { RWD }

final driveValues = EnumValues({"rwd": Drive.RWD});

enum FuelType { DIESEL, GAS }

final fuelTypeValues =
    EnumValues({"diesel": FuelType.DIESEL, "gas": FuelType.GAS});

enum Transmission { A }

final transmissionValues = EnumValues({"a": Transmission.A});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
