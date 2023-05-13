import 'package:flutter/material.dart';
import 'details_estimates.dart';
import '../services/harvest_api.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:agroxpert/utils/date_convert.dart';
import 'package:agroxpert/screens/final_report.dart';
import 'package:agroxpert/widgets/graphs/graph_harvest_production.dart';

import 'estimates_production.dart';

void _verDetalles(BuildContext context, List<Map<String, dynamic>> datos) {
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => DetallesEstimacion(estimaciones: datos)),
  );
}

class HistoricHarvest extends StatefulWidget {
  final String farmLotId;
  const HistoricHarvest({super.key, required this.farmLotId});

  @override
  State<HistoricHarvest> createState() => _HistoricHarvestState();

  static fromJson(harvest) {}
}

class _HistoricHarvestState extends State<HistoricHarvest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial de estimaciones'),
      ),
      body: FutureBuilder(
        future: getHistoricHarvest(widget.farmLotId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Text('Error al obtener los datos');
          } else if (snapshot.connectionState == ConnectionState.done) {
            final historialHarvest = snapshot.data as List<dynamic>;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Tabla
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Table(
                      columnWidths: const {
                        0: FlexColumnWidth(2),
                        1: FlexColumnWidth(2),
                        2: FlexColumnWidth(2),
                      },
                      border: TableBorder.all(width: 1.0),
                      children: [
                        _tableHeader(context),
                        ..._builRowInfo(historialHarvest, context),
                      ],
                    ),
                  ),
                  const GraphHarvestProduction(),

                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Acción que se ejecuta al pulsar el botón
                      },
                      child: const Text('Estimar produccion'),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

TableRow _tableHeader(BuildContext context) {
  return TableRow(
    decoration: BoxDecoration(
      color: Theme.of(context).primaryColorLight,
    ),
    children: const [
      TableCell(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Cosecha',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      TableCell(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Estimaciones',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      TableCell(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Estimacion final',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ],
  );
}

List<TableRow> _builRowInfo(
    List<dynamic> historialHarvest, BuildContext context) {
  List<TableRow> tableRows = [];
  int index = 0;

  if (historialHarvest == null) {
    return tableRows;
  }

  print(historialHarvest);

  for (var harvest in historialHarvest) {
    index++;
    print(harvest['estimates']);
    tableRows.add(
      TableRow(
        children: [
          _buildHarvest(harvest['harvest'], index),
          _buildEstimates(harvest['estimates']),
          _buildFinalReport(harvest['finalProduction'],
              harvest['harvest']['estimates '], context),
        ],
      ),
    );
  }

  return tableRows;
}

Widget _buildHarvest(dynamic harvest, int index) {
  return TableCell(
      child: Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('Cosecha $index', style: const TextStyle(fontSize: 16)),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          dateOnly(DateTime.parse(harvest['evaluationStartDate'])),
          style: const TextStyle(fontSize: 16),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          dateOnly(DateTime.parse(harvest['evaluationEndDate'])),
          style: const TextStyle(fontSize: 16),
        ),
      ),
    ],
  ));
}

Widget _buildEstimates(dynamic estimates) {
  if (estimates == null) {
    return const TableCell(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          'No hay estimaciones',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  return TableCell(
    child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: estimates.length ?? 0,
        itemBuilder: (context, index) {
          final estimate = estimates[index];

          return Container(
            padding: const EdgeInsets.all(8.0),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(FlutterIcons.calendar_ant, color: Colors.green),
                    const SizedBox(width: 8),
                    Text(dateOnly(DateTime.parse(estimate['date']))),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(FlutterIcons.tree_ent, color: Colors.green),
                    const SizedBox(width: 8),
                    Text('${estimate['totalFruitsEstimates']} Frutos'),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(FlutterIcons.boxes_faw5s, color: Colors.green),
                    const SizedBox(width: 8),
                    Text('${estimate['estimatedProduction']} Kg'),
                  ],
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EstimatesProductionScreen(
                              estimate: estimate,
                            ),
                          ));
                    },
                    child: const Text('Ver detalle'),
                  ),
                ),
              ],
            ),
          );
        }),
  );
}

Widget _buildFinalReport(
    dynamic finalReport, List<dynamic> idEstimates, BuildContext context) {
  if (finalReport == null || idEstimates == null) {
    return TableCell(
        child: Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'No Producción Final, la cosecha no ha sido evaluada',
            style: TextStyle(fontSize: 16),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5),
          child: ElevatedButton(
            onPressed: () {
              print('Agregar Producción Final');
            },
            child: const Text(
              'Agregar Producción Final',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    ));
  }

  List<String> ids = idEstimates.map((element) => element.toString()).toList();
  return TableCell(
      child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(FlutterIcons.calendar_ant, color: Colors.green),
            const SizedBox(width: 8),
            Text(dateOnly(DateTime.parse(finalReport['date']))),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(FlutterIcons.tree_ent, color: Colors.green),
            const SizedBox(width: 8),
            Text('${finalReport['totalProduction']} Kg'),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(FlutterIcons.earth_ant, color: Colors.green),
            const SizedBox(width: 8),
            Text('${finalReport['exportMarket']} Kg'),
          ],
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.all(5),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FinalReportScreen(
                      idEstimates: ids, idFinalProduction: finalReport['id']),
                ),
              );
            },
            child: const Text('Ver detalle'),
          ),
        ),
      ],
    ),
  ));
}
