import 'dart:convert';
import 'dart:html';
import 'package:agroxpert/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:agroxpert/models/estimates_model.dart';
import 'package:flutter/services.dart';

import '../models/farm_lot_model.dart';

final dio = Dio();

Future<List<EstimatesModel>> getEstimatesHarvest(
    List<String> idsEstimatesHarvest) async {
  Map<String, dynamic> idsEstimates = {
    "ids": idsEstimatesHarvest,
  };

  final response = await dio.post('$baseUrl/estimates-production/harvest',
      data: idsEstimates);

  List<EstimatesModel> estimates = [];
  for (var estimate in response.data['data']) {
    estimates.add(EstimatesModel.fromJson(estimate));
  }

  return estimates;
}

Future<List<FarmLotModel>> getLots() async {
  List<FarmLotModel> lots = [];
  String jsonString = await rootBundle.loadString('lib/utils/mocks/lots.json');
  final jsonResponse = json.decode(jsonString);
  var jsonList = jsonResponse['response'];
  lots = jsonList
      .map<FarmLotModel>((json) => FarmLotModel.fromJson(json))
      .toList();
  return lots;
}

Future<bool> createEstimation(String farmLotId, String idHarvest,
    List<TreesAssessed> treesAssessed) async {
  Map<String, dynamic> body = {
    "idFarm": farmLotId,
    "idHarvest": idHarvest,
    "treesAssessed": treesAssessed.map((e) => e.toJson()).toList(),
  };

  final response =
      await dio.post('http://127.0.0.1:5000/estimates-production', data: jsonEncode(body));

  print(jsonEncode(body));
  print(response.data);

  return response.data['success'];
}
