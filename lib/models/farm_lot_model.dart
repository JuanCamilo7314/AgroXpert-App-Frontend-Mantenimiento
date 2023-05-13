import 'dart:core';
import 'package:json_annotation/json_annotation.dart';

class FarmLotModel {
  String id;
  String nameLot;
  int numberTrees;
  double treesAge;
  ProductionDate productionDate;
  double averageFruitWeight;

  FarmLotModel(
      {required this.id,
      required this.nameLot,
      required this.numberTrees,
      required this.treesAge,
      required this.productionDate,
      required this.averageFruitWeight});

  factory FarmLotModel.fromJson(Map<String, dynamic> json) {
    return FarmLotModel(
      id: json['id'],
      nameLot: json['nameLot'],
      numberTrees: json['numberTrees'],
      treesAge: json['treesAge'],
      productionDate: ProductionDate.fromJson(json['productionDate']),
      averageFruitWeight: json['averageFruitWeight'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nameLot': nameLot,
      'numberTrees': numberTrees,
      'treesAge': treesAge,
      'productionDate': productionDate.toJson(),
      'averageFruitWeight': averageFruitWeight,
    };
  }
}

class ProductionDate {
  Production primary;
  Production secondary;

  ProductionDate({required this.primary, required this.secondary});

  factory ProductionDate.fromJson(Map<String, dynamic> json) {
    return ProductionDate(
      primary: Production.fromJson(json['primary']),
      secondary: Production.fromJson(json['secondary']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'primary': primary.toJson(),
      'secondary': secondary.toJson(),
    };
  }
}

class Production {
  DateTime initial;
  @JsonKey(name: 'final')
  DateTime theFinal;

  Production({required this.initial, required this.theFinal});

  factory Production.fromJson(Map<String, dynamic> json) {
    return Production(
      initial: DateTime.parse(json['initial']),
      theFinal: DateTime.parse(json['final']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'initial': initial.toIso8601String(),
      'final': theFinal.toIso8601String(),
    };
  }
}
