import 'dart:developer';

import 'package:dio/dio.dart';

import '../model/car_model.dart';

class CarsRepo {
  List<CarModel> carList = [];

  static Future<List<CarModel>> fetchData() async {
    String url = 'https://api.api-ninjas.com/v1/cars?make=mercedes&limit=10';
    Response response = await Dio().get(
      url,
      options: Options(
        headers: {
          'X-Api-Key': 'eYobgacd4JskW9chBQA7Eg==JH7FCsiUhXTxGKYY',
        },
      ),
    );

    try {
      if (response.statusCode == 200) {
        var result = response.data as List;
        // log(result.length.toString());
        // log(result.toString());
        // log(result.map((e) => CarModel.fromJson(e)).toList().toString());
        return result.map((e) => CarModel.fromJson(e)).toList();
      }
    } catch (e) {
      throw Exception(e);
    }

    return [];
  }
}
