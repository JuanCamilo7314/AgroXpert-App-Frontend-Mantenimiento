import 'package:agroxpert/models/estimates_model.dart';
import 'package:flutter/material.dart';
import '../widgets/accordion_estimates.dart';
import '../widgets/accordion_final_production.dart';


class FinalReportScreen extends StatefulWidget {
  const FinalReportScreen({super.key});

  @override
  State<FinalReportScreen> createState() => _FinalReportScreen();
}

class _FinalReportScreen extends State<FinalReportScreen> {
  final EstimatesModel estimateExm = EstimatesModel(
      id: '1',
      date: DateTime.now(),
      averageFruits: 30,
      estimatedProduction: 8000,
      totalFruitsEstimates: 1000,
      numberTrees: 20,
      treesAssessed: <TreesAssessed> [
        TreesAssessed(numFruits: 50, numQuartiles: 2),
        TreesAssessed(numFruits: 40, numQuartiles: 1),
        TreesAssessed(numFruits: 30, numQuartiles: 1),
        TreesAssessed(numFruits: 20, numQuartiles: 1),
        TreesAssessed(numFruits: 10, numQuartiles: 1),
        TreesAssessed(numFruits: 0, numQuartiles: 1),
      ]

    );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Informe Final de Cosecha'),
        ),
        body: Column(children:  [
          AccordionEstimates(estimate: estimateExm , index: 1),
          const AccordionFinalProduction(
            title: 'Resultado Final de Cosecha',
            content:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam bibendum ornare vulputate. Curabitur faucibus condimentum purus quis tristique.',
          ),

        ]));
  }
}
