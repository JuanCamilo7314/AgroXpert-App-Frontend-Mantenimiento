import 'dart:core';

class CreateHarvest {
  String type;
  String idFarmLot;
  DateTime evaluationStartDate;
  DateTime evaluationEndDate;

  CreateHarvest({
    required this.type,
    required this.idFarmLot,
    required this.evaluationStartDate,
    required this.evaluationEndDate,
  });

  factory CreateHarvest.fromJson(Map<String, dynamic> json) {
    return CreateHarvest(
      type: json['type'],
      idFarmLot: json['idFarmLot'],
      evaluationStartDate: DateTime.parse(json['evaluationStartDate']),
      evaluationEndDate: DateTime.parse(json['evaluationEndDate']),
    );
  }

  Map<String, dynamic> toJson() => {
        'type': type,
        'idFarmLot': idFarmLot,
        'evaluationStartDate': evaluationStartDate.toIso8601String(),
        'evaluationEndDate': evaluationEndDate.toIso8601String(),
      };
}
