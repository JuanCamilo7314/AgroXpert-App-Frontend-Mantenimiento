import 'dart:core';
import 'package:json_annotation/json_annotation.dart';

class EstimatesProductionModel {
  @JsonKey(name: '_id')
  String id;
  DateTime date;
  int ageFruits;
  int numberTrees;
  int totalFruitsEstimates;
  double averageFruits;
  double estimatedProduction;
  List<TreesAssessed> treesAssessed;

  EstimatesProductionModel(
      {required this.id,
      required this.date,
      required this.ageFruits,
      required this.numberTrees,
      required this.totalFruitsEstimates,
      required this.averageFruits,
      required this.estimatedProduction,
      required this.treesAssessed});

  factory EstimatesProductionModel.fromJson(Map<String, dynamic> json) {
    return EstimatesProductionModel(
      id: json['_id'],
      date: DateTime.parse(json['date']),
      numberTrees: json['numberTrees'],
      ageFruits: json['ageFruits'],
      totalFruitsEstimates: json['totalFruitsEstimates'],
      averageFruits: json['averageFruits'],
      estimatedProduction: json['estimatedProduction'],
      treesAssessed: List<TreesAssessed>.from(
          json['treesAssessed'].map((x) => TreesAssessed.fromJson(x))),
    );
  }

}

class TreesAssessed {
  int numFruits;
  int numQuartiles;

  TreesAssessed({required this.numFruits, required this.numQuartiles});

  factory TreesAssessed.fromJson(Map<String, dynamic> json) {
    return TreesAssessed(
      numFruits: json['numFruits'],
      numQuartiles: json['numQuartiles'],
    );
  }
}