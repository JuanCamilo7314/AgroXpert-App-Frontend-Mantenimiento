import 'dart:core';

class FinalProductionModel {
  String id;
  DateTime date;
  int totalProduction;
  int exportMarket;
  int nationalMarket;
  int waste;
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
    
    if (json['caliberDivision'] == null) {
      return FinalProductionModel(
        id: json['id'],
        date: DateTime.now(),
        totalProduction: json['totalProduction'],
        exportMarket: json['exportMarket'],
        nationalMarket: json['nationalMarket'],
        waste: json['waste'],
        caliberDivision: [],
      );
    }

    return FinalProductionModel(
      id: json['id'],
      date: DateTime.parse(json['date']),
      totalProduction: json['totalProduction'],
      exportMarket: json['exportMarket'],
      nationalMarket: json['nationalMarket'],
      waste: json['waste'],
      caliberDivision: json['caliberDivision'].map<CaliberDivision>((x) => CaliberDivision.fromJson(x)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date.toIso8601String(),
      'totalProduction': totalProduction,
      'exportMarket': exportMarket,
      'nationalMarket': nationalMarket,
      'waste': waste,
      'caliberDivision': caliberDivision.map((x) => x.toJson()).toList(),
    };
  }
}

class CaliberDivision {
  String category;
  int quantity;

  CaliberDivision({required this.category, required this.quantity});

  factory CaliberDivision.fromJson(Map<String, dynamic> json) {
    return CaliberDivision(
      category: json['category'],
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'quantity': quantity,
    };
  }
}

