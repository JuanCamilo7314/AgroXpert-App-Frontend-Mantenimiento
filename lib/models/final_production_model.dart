import 'dart:core';

class FinalProductionModel {
  String id;
  DateTime date;
  double totalProduction;
  double exportMarket;
  double nationalMarket;
  double waste;
  List<CaliberDivision> caliberDivision;
  

  FinalProductionModel(
      {required this.id,
      required this.date,
      required this.totalProduction,
      required this.exportMarket,
      required this.nationalMarket,
      required this.waste,
      required this.caliberDivision});

  factory FinalProductionModel.fromJson(Map<String, dynamic> json) {
    return FinalProductionModel(
      id: json['id'],
      date: DateTime.parse(json['date']),
      totalProduction: json['totalProduction'],
      exportMarket: json['exportMarket'],
      nationalMarket: json['nationalMarket'],
      waste: json['waste'],
      caliberDivision: List<CaliberDivision>.from(
          json['caliberDivision'].map((x) => CaliberDivision.fromJson(x))),
    );
  }
}

class CaliberDivision {
  String category;
  double quantity;

  CaliberDivision({required this.category, required this.quantity});

  factory CaliberDivision.fromJson(Map<String, dynamic> json) {
    return CaliberDivision(
      category: json['category'],
      quantity: json['quantity'],
    );
  }
}

