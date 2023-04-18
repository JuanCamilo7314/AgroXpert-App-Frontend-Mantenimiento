import 'package:agroxpert/models/estimates_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:agroxpert/utils/date_convert.dart';

class EstimatesProductionScreen extends StatefulWidget {
  final dynamic estimate;
  const EstimatesProductionScreen({super.key, required this.estimate});

  @override
  State<EstimatesProductionScreen> createState() =>
      _EstimatesProductionScreen();
}

class _EstimatesProductionScreen extends State<EstimatesProductionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Informe Final de Cosecha'),
        ),
        body: SingleChildScrollView(
          child: Card(margin: const EdgeInsets.all(10), child: _content(widget.estimate)),
        ));
  }
}

Widget _content(dynamic estimate) {
  return Column(
    children: [
      _fielDateEstimate(DateTime.parse(estimate['date'])),
      const SizedBox(height: 10),
      _fieldNumTrees(estimate['numTrees']),
      const SizedBox(height: 10),
      _fieldTotalFruitsEstimates(estimate['totalFruitsEstimates']),
      const SizedBox(height: 10),
      _fieldAverageFruits(estimate['averageFruits']),
      const SizedBox(height: 10),
      _fieldEstimatedProduction(estimate['estimatedProduction']),
      const SizedBox(height: 20),
      _tableEstimatesTrees(estimate['treesAssessed']),
    ],
  );
}

Widget _fielDateEstimate(DateTime date) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      const Icon(FlutterIcons.calendar_ant, color: Colors.green),
      const SizedBox(width: 8),
      const Text('Fecha de estimación: ',
          style: TextStyle(fontWeight: FontWeight.bold)),
      Text(dateOnly(date)),
    ],
  );
}

Widget _fieldNumTrees(int numberTrees) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      const Icon(FlutterIcons.tree_mco, color: Colors.green),
      const SizedBox(width: 8),
      const Text('Numero de arboles: ',
          style: TextStyle(fontWeight: FontWeight.bold)),
      Text('$numberTrees Arboles'),
    ],
  );
}

Widget _fieldTotalFruitsEstimates(int totalFruitsEstimates) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      const Icon(FlutterIcons.apple_o_ant, color: Colors.green),
      const SizedBox(width: 8),
      const Text('Total de frutos estimados: ',
          style: TextStyle(fontWeight: FontWeight.bold)),
      Text('$totalFruitsEstimates Frutos'),
    ],
  );
}

Widget _fieldAverageFruits(double averageFruits) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      const Icon(FlutterIcons.tree_ent, color: Colors.green),
      const SizedBox(width: 8),
      const Text('Promedio de frutos por arbol: ',
          style: TextStyle(fontWeight: FontWeight.bold)),
      Text('$averageFruits Frutos'),
    ],
  );
}

Widget _fieldEstimatedProduction(double estimatedProduction) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      const Icon(FlutterIcons.boxes_faw5s, color: Colors.green),
      const SizedBox(width: 8),
      const Text('Estimado de produccion Total: ',
          style: TextStyle(fontWeight: FontWeight.bold)),
      Text('$estimatedProduction Kg'),
    ],
  );
}

Widget _tableEstimatesTrees(dynamic treesAssessed) {
  int index = 1;
  return Table(
    border: TableBorder.all(
      color: Colors.grey.shade600,
      width: 1,
      borderRadius: BorderRadius.circular(20.0),
      style: BorderStyle.solid,
    ),
    children: [
      TableRow(
        decoration: BoxDecoration(
          color: Colors.orange.shade300,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        children: const [
          TableCell(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Arbol',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          TableCell(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Numero de Frutos',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          TableCell(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Cuartiles',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      for (dynamic treeAssessed in treesAssessed)
        TableRow(
          children: [
            TableCell(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  (index++).toString(),
                ),
              ),
            ),
            TableCell(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '${treeAssessed['numFruits']}',
              ),
            )),
            TableCell(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '${treeAssessed['numQuartiles']}',
                ),
              ),
            ),
          ],
        ),
    ],
  );
}
