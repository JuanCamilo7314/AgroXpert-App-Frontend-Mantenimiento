import 'package:dio/dio.dart';
import 'dart:io';

import 'package:agroxpert/models/farm_lot_model.dart';

final dio = Dio(); // crea una instancia de Dio

Future<List<FarmLotModel>> getLots() async {
  List<FarmLotModel> lots = [];

  try {
    final response = await dio.get('http://127.0.0.1:5000/farm-lot');

    var jsonList = response.data.data;

    print(response);
    print("------------------");
    print(jsonList);

    lots = jsonList
        .map<FarmLotModel>((json) => FarmLotModel.fromJson(json))
        .toList();
    return lots;
  } catch (e) {
    throw Exception(e);
  }
}
