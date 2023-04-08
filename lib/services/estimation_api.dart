import 'package:agroxpert/models/farm_lot_model.dart';

Future<List<FarmLotModel>> getLots() {
  List<FarmLotModel> lots = [];
  for (int i = 0; i < 10; i++) {
    lots.add(FarmLotModel(
      id: i.toString(),
      nameLot: String.fromCharCodes(List.generate(10, (index) => 65 + index)),
      numberTrees: int.parse(
          String.fromCharCodes(List.generate(3, (index) => 48 + index))),
      productionDate: ProductionDate(
        primary: Production(initial: DateTime.now(), theFinal: DateTime.now()),
        secondary:
            Production(initial: DateTime.now(), theFinal: DateTime.now()),
      ),
      treesAge: double.parse(
          String.fromCharCodes(List.generate(2, (index) => 48 + index))),
    ));
  }
  return Future.delayed(Duration(seconds: 2), () => lots);
}
