import 'package:agroxpert/models/estimates_production.dart';
import 'package:flutter/material.dart';
import '../models/estimates_production.dart';
import '../widgets/accordion_production_estimates.dart';

class EstimatesProductionScreen extends StatefulWidget {
  const EstimatesProductionScreen({super.key});

  @override
  State<EstimatesProductionScreen> createState() => _EstimatesProductionScreen();
}

class _EstimatesProductionScreen extends State<EstimatesProductionScreen> {
  final EstimatesProductionModel estimateExm = EstimatesProductionModel(
      id: '1',
      date: DateTime.now(),
      averageFruits: 30,
      ageFruits: 20,
      estimatedProduction: 8000,
      totalFruitsEstimates: 1000,
      numberTrees: 20,
      treesAssessed: <TreesAssessed>[
        TreesAssessed(numFruits: 50, numQuartiles: 2),
        TreesAssessed(numFruits: 40, numQuartiles: 1),
        TreesAssessed(numFruits: 30, numQuartiles: 1),
        TreesAssessed(numFruits: 20, numQuartiles: 1),
        TreesAssessed(numFruits: 10, numQuartiles: 1),
        TreesAssessed(numFruits: 0, numQuartiles: 1),
      ]);

        @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Informe Final de Cosecha'),
        ),
        body: SingleChildScrollView(
        child: Column(children: [
          AccordionEstimates(estimate: estimateExm, index: 1),
        ])));
  }


}
