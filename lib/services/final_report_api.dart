import 'dart:convert';
import 'dart:io';

import 'package:agroxpert/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:agroxpert/models/final_production_model.dart';

final dio = Dio();

Future<FinalProductionModel> getFinalReportProduction(idFinalProduction) async {
  final response =
      await dio.get('$baseUrl/final-production/$idFinalProduction');
  Map<String, dynamic> dataInformation = response.data['data'];
  final finalProduction = FinalProductionModel.fromJson(dataInformation);
  return finalProduction;
}

Future<bool> createFinalProduction(
    FinalProductionModel finalProduction, String idHarvest) async {
  try {
    final response = await dio.post(
      '$baseUrl/final-production/$idHarvest',
      data: jsonEncode(finalProduction.toJson()),
    );

    if (response.statusCode == HttpStatus.created) {
      return response.data['success'];
    }
    return false;
  } catch (e) {
    return false;
  }
}
