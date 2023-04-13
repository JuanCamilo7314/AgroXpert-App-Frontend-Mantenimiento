import 'package:agroxpert/models/final_production_model.dart';

Future<FinalProductionModel> getFinalReportProduction() async {
  FinalProductionModel finalProduction = FinalProductionModel(
    id: '2sd',
    date: DateTime.now(),
    exportMarket: 3000,
    nationalMarket: 5000,
    waste: 30,
    totalProduction: 8030,
    caliberDivision: <CaliberDivision> [
      CaliberDivision(category: '10', quantity: 1000),
      CaliberDivision(category: '20', quantity: 1000),
      CaliberDivision(category: '30', quantity: 1000),
      CaliberDivision(category: '40', quantity: 1000),
      CaliberDivision(category: '50', quantity: 1000),
    ]

  );
  
  return finalProduction;
}