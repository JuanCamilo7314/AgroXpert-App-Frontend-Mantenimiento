import 'dart:core';

import 'package:agroxpert/models/estimates_model.dart';
import 'package:agroxpert/models/final_production_model.dart';
import 'package:agroxpert/models/harvest_model.dart';

class HistoricHarvestModel {
  String id;
  String type;
  String idFarmLot;
  DateTime evaluationStartDate;
  DateTime evaluationEndDate;
  List<EstimatesModel> estimates;
  FinalProductionModel summaryFinalProduction;

  HistoricHarvestModel({
    required this.id,
    required this.type,
    required this.idFarmLot,
    required this.evaluationStartDate,
    required this.evaluationEndDate,
    required this.estimates,
    required this.summaryFinalProduction,
  });

  factory HistoricHarvestModel.fromJson(Map<String, dynamic> json) {
    return HistoricHarvestModel(
      id: json['id'],
      type: json['type'],
      idFarmLot: json['idFarmLot'],
      evaluationStartDate: DateTime.parse(json['evaluationStartDate']),
      evaluationEndDate: DateTime.parse(json['evaluationEndDate']),
      estimates: List<EstimatesModel>.from(
          json['estimates'].map((x) => EstimatesModel.fromJson(x))),
      summaryFinalProduction:
          FinalProductionModel.fromJson(json['summaryFinalProduction']),
    );
  }
}
