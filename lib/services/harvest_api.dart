import 'package:agroxpert/models/historic_harvest_model.dart';
import 'package:dio/dio.dart';

final dio = Dio();

Future<List<HistoricHarvestModel>> getHistoricHarvest(String idFarmLot) async {
  final response = await dio.get('localhost:5000/harvest/historic/$idFarmLot');

  List<dynamic> dataInformation = response.data['data'];

  List<HistoricHarvestModel>? historicHarvests =
      dataInformation.map((e) => HistoricHarvestModel.fromJson(e)).toList();

  return historicHarvests;
}
