import 'dart:core';

class EstimatesModel {
  String id;
  DateTime date;
  int numberTrees;
  int totalFruitsEstimates;
  double averageFruits;
  double estimatedProduction;
  List<TreesAssessed> treesAssessed;

  EstimatesModel(
      {required this.id,
      required this.date,
      required this.numberTrees,
      required this.totalFruitsEstimates,
      required this.averageFruits,
      required this.estimatedProduction,
      required this.treesAssessed});

  factory EstimatesModel.fromJson(Map<String, dynamic> json) {
    return EstimatesModel(
      id: json['id'],
      date: DateTime.parse(json['date']),
      numberTrees: json['numTrees'],
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

  Map<String, dynamic> toJson() => {
        "numFruits": numFruits,
        "numQuartiles": numQuartiles,
      };
}
