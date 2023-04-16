import 'dart:core';

class Harvest {
  String id;
  String type;
  String idFarmLot;
  DateTime evaluationStartDate;
  DateTime evaluationEndDate;
  List<String> estimates;
  String summaryFinalProduction;

  Harvest({
    required this.id,
    required this.type,
    required this.idFarmLot,
    required this.evaluationStartDate,
    required this.evaluationEndDate,
    required this.estimates,
    required this.summaryFinalProduction,
  });

  factory Harvest.fromJson(Map<String, dynamic> json) {
    return Harvest(
      id: json['id'],
      type: json['type'],
      idFarmLot: json['idFarmLot'],
      evaluationStartDate: DateTime.parse(json['evaluationStartDate']),
      evaluationEndDate: DateTime.parse(json['evaluationEndDate']),
      estimates: List<String>.from(json['estimates']),
      summaryFinalProduction: json['summaryFinalProduction'],
    );
  }
}
