import 'package:agroxpert/models/estimates_model.dart';
import 'package:flutter/material.dart';
import '../widgets/accordion_estimates.dart';
import '../widgets/accordion_final_production.dart';
import '../services/estimation_api.dart';

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
        body: SingleChildScrollView(
            child: Column(children: [
          FutureBuilder(
            future: getEstimatesHarvest(['6430b352e6ae07dbea1af512', '6430b59de6ae07dbea1af517', '6430bdede6ae07dbea1af51d']),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                final estimates = snapshot.data as List<EstimatesModel>;
                return Column(
                  children: estimates
                      .asMap()
                      .map((index, estimate) => MapEntry(
                            index,
                            AccordionEstimates(
                              estimate: estimate,
                              index: index + 1,
                            ),
                          ))
                      .values
                      .toList(),
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
          const AccordionFinalProduction(
              idFinalProduction: '6430ab83e6ae07dbea1af50a'),
        ])));
  }
}
