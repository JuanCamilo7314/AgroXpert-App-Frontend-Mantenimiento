import 'package:agroxpert/screens/register_harvest.dart';
import 'package:flutter/material.dart';
import 'details_estimates.dart';
import '../services/harvest_api.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:agroxpert/utils/date_convert.dart';
import 'package:agroxpert/screens/final_report.dart';
import 'package:agroxpert/widgets/graphs/graph_harvest_production.dart';
import 'package:agroxpert/screens/create_final_report.dart';

import 'estimates_form.dart';
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
  final String farmLotName;
  const HistoricHarvest(
      {super.key, required this.farmLotId, required this.farmLotName});

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
            bool hasData = false;
            List<dynamic> historialHarvest = [];
            if (snapshot.data != null && snapshot.data != []) {
              historialHarvest = snapshot.data as List<dynamic>;
              hasData = true;
            }
            return Stack(
              children: [
                hasData
                    ? SingleChildScrollView(
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
                                  ..._builRowInfo(historialHarvest, context,
                                      widget.farmLotId, widget.farmLotName),
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
                      )
                    : const Center(
                        child: Text('No hay cosechas registradas'),
                      ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                      onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HarvestRegister(
                                farmLotId: widget.farmLotId,
                                farmLotName: widget.farmLotName),
                          ),
                        ),
                      },
                      child: const Text("Registrar cosecha"),
                    ),
                  ),
                ),
              ],
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

List<TableRow> _builRowInfo(List<dynamic> historialHarvest,
    BuildContext context, String farmLotId, String farmLotName) {
  List<TableRow> tableRows = [];
  int index = 0;
  String harvestId = '';

  if (historialHarvest == null) {
    return tableRows;
  }

  for (var harvest in historialHarvest) {
    index++;
    harvestId = harvest['harvest']['id'];
    tableRows.add(
      TableRow(
        children: [
          _buildHarvest(context, harvest['harvest'], farmLotId, index, farmLotName),
          _buildEstimates(harvest['estimates']),
          _buildFinalReport(
              harvest['finalProduction'],
              harvest['harvest']['estimates '],
              harvestId,
              context,
              farmLotId,
              farmLotName),
        ],
      ),
    );
  }

  return tableRows;
}

Widget _buildHarvest(
    BuildContext context, dynamic harvest, String idFarmLot, int index, String farmLotName) {
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Expanded(
                flex: 1,
                child:
                    Text('Agregar Estimación', style: TextStyle(fontSize: 16)),
              ),
              const SizedBox(width: 10),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          AddTreeForm(idLot: idFarmLot, harvestId: harvest['id'], farmLotName: farmLotName),
                    ),
                  );
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
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

  bool hasData = estimates != null && estimates != [];
  return TableCell(
    child: hasData
        ? ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: estimates!.length ?? 0,
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
                        const Icon(FlutterIcons.calendar_ant,
                            color: Colors.green),
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
                        const Icon(FlutterIcons.boxes_faw5s,
                            color: Colors.green),
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
            })
        : const Center(
            child: Text("No hay estimaciones"),
          ),
  );
}

Widget _buildFinalReport(
    dynamic finalReport,
    List<dynamic> idEstimates,
    String harvestId,
    BuildContext context,
    String farmLotId,
    String farmLotName) {
  if (finalReport == null || idEstimates == null) {
    return TableCell(
        child: Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'No Producción Final, la cosecha no ha sido evaluada.',
            style: TextStyle(fontSize: 16),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(3),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreateFinalReportScreen(
                        harvetsId: harvestId,
                        farmLotId: farmLotId,
                        farmLotName: farmLotName),
                  ));
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
