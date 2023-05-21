import 'dart:convert';
import 'dart:io';

import 'package:agroxpert/models/create_harvest_model.dart';
import 'package:agroxpert/models/harvest_model.dart';
import 'package:agroxpert/models/historic_harvest_model.dart';
import 'package:agroxpert/utils/constants.dart';
import 'package:dio/dio.dart';

import '../models/estimates_model.dart';
import '../models/final_production_model.dart';

final dio = Dio();

Future<List<HistoricHarvestModel>> getHistoricHarvest(String idFarmLot) async {
  final response = await dio.get('$baseUrl/harvest/historic/$idFarmLot');
  dynamic dataInformation = response.data['data'];

  if (dataInformation == null) {
    return [];
  }

  List<HistoricHarvestModel> harvestInformation = [];
  for (var harvest in dataInformation) {
    HistoricHarvestModel historicHarvest =
        HistoricHarvestModel.fromJson(harvest);
        
    harvestInformation.add(historicHarvest);
  }
  return harvestInformation;
}

Future<bool> createHarvest(CreateHarvest harvest) async {
  final response =
      await dio.post('$baseUrl/harvest', data: jsonEncode(harvest.toJson()));

  if (response.statusCode == HttpStatus.ok) {
    return response.data['success'];
  }
  return false;
}
