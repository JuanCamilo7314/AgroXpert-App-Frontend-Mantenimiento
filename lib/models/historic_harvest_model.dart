import 'dart:core';

import 'package:agroxpert/models/estimates_model.dart';
import 'package:agroxpert/models/final_production_model.dart';
import 'package:agroxpert/models/harvest_model.dart';

class HistoricHarvestModel {
  Harvest harvest;
  List<EstimatesModel> estimates;
  FinalProductionModel finalProduction;

  HistoricHarvestModel({
    required this.harvest,
    required this.estimates,
    required this.finalProduction,
  });

  factory HistoricHarvestModel.fromJson(Map<String, dynamic> json) {
    return HistoricHarvestModel(
      harvest: Harvest.fromJson(json['harvest']),
      estimates: List<EstimatesModel>.from(json['estimates']),
      finalProduction: FinalProductionModel.fromJson(json['finalProduction']),
    );
  }
}
