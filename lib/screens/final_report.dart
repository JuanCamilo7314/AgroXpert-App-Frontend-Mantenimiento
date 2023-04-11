import 'package:flutter/material.dart';
import '../widgets/accordion_estimates.dart';
import '../widgets/accordion_final_production.dart';


class FinalReportScreen extends StatefulWidget {
  const FinalReportScreen({super.key});

  @override
  State<FinalReportScreen> createState() => _FinalReportScreen();
}

class _FinalReportScreen extends State<FinalReportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Informe Final de Cosecha'),
        ),
        body: Column(children: const [
          AccordionEstimates(
            title: 'Section #1',
            content:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam bibendum ornare vulputate. Curabitur faucibus condimentum purus quis tristique.',
          ),
          AccordionFinalProduction(
            title: 'Resultado Final de Cosecha',
            content:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam bibendum ornare vulputate. Curabitur faucibus condimentum purus quis tristique.',
          ),

        ]));
  }
}
