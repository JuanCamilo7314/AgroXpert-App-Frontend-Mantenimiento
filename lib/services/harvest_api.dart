import 'package:agroxpert/models/historic_harvest_model.dart';
import 'package:dio/dio.dart';

final dio = Dio();

Future<List<HistoricHarvestModel>> getHistoricHarvest(String idFarmLot) async {
  print('idFarmLot: $idFarmLot');
  final response =
      await dio.get('http://127.0.0.1:5000/harvest/historic/$idFarmLot');

  List<dynamic> dataInformation = response.data['data'];

  List<HistoricHarvestModel> historicHarvests =
      dataInformation.map((e) => HistoricHarvestModel.fromJson(e)).toList();

  print('historicHarvests: $historicHarvests');

  return historicHarvests;
}
