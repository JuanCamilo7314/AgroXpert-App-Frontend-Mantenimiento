import 'dart:convert';
import 'dart:io';

import 'package:agroxpert/models/farm_lot_model.dart';
import 'package:flutter/services.dart' show rootBundle;

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
