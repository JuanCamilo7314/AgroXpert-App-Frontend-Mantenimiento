import 'package:agroxpert/models/estimates_model.dart';
import 'package:flutter/material.dart';
import '../widgets/accordion_estimates.dart';
import '../widgets/accordion_final_production.dart';
import '../services/estimation_api.dart';
import '../widgets/graphs/bargraph_estimaciones.dart';
import '../models/final_production_model.dart';

class FinalReportScreen extends StatefulWidget {
  final List<String> idEstimates;
  final String idFinalProduction;
  const FinalReportScreen({super.key, required this.idEstimates, required this.idFinalProduction});

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
            future: getEstimatesHarvest(widget.idEstimates),
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
          AccordionFinalProduction(idFinalProduction: widget.idFinalProduction),
          AccordionBarGraph(idEstimates: widget.idEstimates, idFinalProduction: widget.idFinalProduction),
          //const BarChart(),
        ])));
  }
}
