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
    Harvest newHarvest = Harvest.fromJson(json['harvest']);

    FinalProductionModel newFinalProduction =
        FinalProductionModel.fromJson(json['finalProduction']);

    List<dynamic> estimatesJson = json['estimates'];
    List<EstimatesModel> newsEstiamtes =
        estimatesJson.map((json) => EstimatesModel.fromJson(json)).toList();

    return HistoricHarvestModel(
      harvest: newHarvest,
      finalProduction: newFinalProduction,
      estimates: newsEstiamtes,
    );
  }
}
