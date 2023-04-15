import 'package:dio/dio.dart';
import 'package:agroxpert/models/final_production_model.dart';

final dio = Dio();

Future<FinalProductionModel> getFinalReportProduction(idFinalProduction) async {
  final response = await dio.get('http://127.0.0.1:5000/final-production/$idFinalProduction');
  Map<String, dynamic> dataInformation = response.data['data'];
  final finalProduction = FinalProductionModel.fromJson(dataInformation);
  return finalProduction;
}