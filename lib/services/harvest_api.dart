import 'package:agroxpert/models/harvest_model.dart';
import 'package:agroxpert/models/historic_harvest_model.dart';
import 'package:dio/dio.dart';

import '../models/estimates_model.dart';
import '../models/final_production_model.dart';

final dio = Dio();

Future <dynamic> getHistoricHarvest(String idFarmLot) async {
  final response =
      await dio.get('http://127.0.0.1:5000/harvest/historic/$idFarmLot');

  dynamic dataInformation = response.data['data'];

  return dataInformation;
}
