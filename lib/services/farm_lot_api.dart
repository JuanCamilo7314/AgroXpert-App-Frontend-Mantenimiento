import 'dart:convert';

import 'package:agroxpert/utils/constants.dart';
import 'package:dio/dio.dart';
import 'dart:io';

import 'package:agroxpert/models/farm_lot_model.dart';

final dio = Dio(); // crea una instancia de Dio

Future<List<FarmLotModel>> getLots() async {
  final response = await dio.get('$baseUrl/farm-lot');
  List<dynamic> dataInformation = response.data['data'];

  List<FarmLotModel> lots =
      dataInformation.map((e) => FarmLotModel.fromJson(e)).toList();

  return lots;
}

Future<bool> createLot(FarmLotModel lot) async {
  final response = await dio.post(
    '$baseUrl/farm-lot',
    data: jsonEncode(lot.toJson()),
  );
  // Validaciones de respuesta
  if (response.statusCode == HttpStatus.ok) {
    return response.data['success'];
  }
  return false;
}
