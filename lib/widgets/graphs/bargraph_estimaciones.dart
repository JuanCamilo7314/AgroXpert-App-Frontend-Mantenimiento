import 'package:agroxpert/models/estimates_model.dart';
import 'package:agroxpert/models/final_production_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:agroxpert/utils/date_convert.dart';
import 'package:agroxpert/services/graphic_api.dart';

class AccordionBarGraph extends StatefulWidget {
  final List<String> idEstimates;
  final String idFinalProduction;

  const AccordionBarGraph(
      {super.key, required this.idEstimates, required this.idFinalProduction});
  @override
  State<AccordionBarGraph> createState() => _AccordionBarGraph();
}

class _AccordionBarGraph extends State<AccordionBarGraph> {
  bool _showContent = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(children: [
        // The title
        ListTile(
          title: _titelAccordion(),
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
                child: FutureBuilder(
            future: getEstimatesVsProduction(widget.idEstimates, widget.idFinalProduction),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                final dataGraphs = snapshot.data;
                return _contentAccordion(dataGraphs);
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
              )
            : Container()
      ]),
    );
  }
}

Widget _titelAccordion() {
  return const Text(
    'Estimaciones vs Producción',
    style: TextStyle(fontWeight: FontWeight.bold),
  );
}

Widget _contentAccordion(dynamic dataGraphs) {
  print(dataGraphs);
  return Column(
    children: [  
    ],
  );
}
