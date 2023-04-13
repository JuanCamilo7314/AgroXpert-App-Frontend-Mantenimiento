import 'package:agroxpert/models/estimates_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:agroxpert/utils/date_convert.dart';

class AccordionEstimates extends StatefulWidget {
  final EstimatesModel estimate;
  final int index;

  const AccordionEstimates(
      {super.key, required this.estimate, required this.index});
  @override
  State<AccordionEstimates> createState() => _AccordionEstimates();
}

class _AccordionEstimates extends State<AccordionEstimates> {
  // Show or hide the content
  bool _showContent = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(children: [
        // The title
        ListTile(
          title: _titelAccordion(widget.estimate.date, widget.index),
          trailing: IconButton(
            icon: Icon(
                _showContent ? Icons.arrow_drop_up : Icons.arrow_drop_down),
            onPressed: () {
              setState(() {
                _showContent = !_showContent;
              });
            },
          ),
        ),
        _showContent
            ? Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: _contentAccordion(widget.estimate),
              )
            : Container()
      ]),
    );
  }
}

Widget _titelAccordion(DateTime date, int index) {
  return Text(
    'Estimación #$index ${dateOnly(date)}',
    style: const TextStyle(fontWeight: FontWeight.bold),
  );
}

Widget _contentAccordion(EstimatesModel estimate) {
  return Column(
    children: [
      _fieldNumTrees(estimate.numberTrees),
      const SizedBox(height: 10),
      _fieldTotalFruitsEstimates(estimate.totalFruitsEstimates),
      const SizedBox(height: 10),
      _fieldAverageFruits(estimate.averageFruits),
      const SizedBox(height: 10),
      _fieldEstimatedProduction(estimate.estimatedProduction),
      const SizedBox(height: 20),
      _tableEstimatesTrees(estimate.treesAssessed),
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

Widget _tableEstimatesTrees(List<TreesAssessed> treesAssessed) {
  int index = 1;
  return Table(
    border: TableBorder.all(
      color: Colors.grey.shade600,
      width: 1,
      style: BorderStyle.solid,
    ),
    children: [
      TableRow(
        decoration: BoxDecoration(
          color: Colors.orange.shade300,
          borderRadius: BorderRadius.circular(1.0),
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
      for (TreesAssessed treeAssessed in treesAssessed)
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
                '${treeAssessed.numFruits}',
              ),
            )),
            TableCell(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '${treeAssessed.numQuartiles}',
                ),
              ),
            ),
          ],
        ),
    ],
  );
}
