import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:agroxpert/models/estimates_model.dart';
import 'package:flutter/services.dart';
import '../models/farm_lot_model.dart';

final dio = Dio();

Future getEstimatesVsProduction(
    List<String> idsEstimates, String idFinalProduction) async {
  Map<String, dynamic> ids = {
    "ids": idsEstimates,
  };

  final responseEstimates = await dio
      .post('http://127.0.0.1:5000/estimates-production/harvest', data: ids);
  final responseProduction = await dio
      .get('http://127.0.0.1:5000/final-production/$idFinalProduction');

  dynamic dataMaping = mapData(responseEstimates.data['data'], responseProduction.data['data']);

  return dataMaping;
}


Map<String, dynamic> mapData(dynamic estimates, dynamic productionFinal){
  Map<String, dynamic> data = {
    'estimates': [],
    'producctionFinal': 0
  };

  data['producctionFinal'] = productionFinal['totalProduction'];

  for (var estimate in estimates) {
    data['estimates'].add(estimate['estimatedProduction']);
  }

  return data;
}


