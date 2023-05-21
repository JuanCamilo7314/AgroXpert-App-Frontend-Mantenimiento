import 'package:agroxpert/models/estimates_model.dart';
import 'package:agroxpert/models/final_production_model.dart';
import 'package:agroxpert/screens/register_harvest.dart';
import 'package:flutter/material.dart';
import 'details_estimates.dart';
import '../services/harvest_api.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:agroxpert/utils/date_convert.dart';
import 'package:agroxpert/screens/final_report.dart';
import 'package:agroxpert/widgets/graphs/graph_harvest_production.dart';
import 'package:agroxpert/screens/create_final_report.dart';
import 'package:agroxpert/models/historic_harvest_model.dart';

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
            late List<HistoricHarvestModel> historialHarvest= [];
            if (snapshot.data != null && snapshot.data != []) {
              historialHarvest = snapshot.data as List<HistoricHarvestModel>;

              if (historialHarvest.isNotEmpty){
                hasData = true;
              }
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

List<TableRow> _builRowInfo(List<HistoricHarvestModel> historialHarvest,
    BuildContext context, String farmLotId, String farmLotName) {
  List<TableRow> tableRows = [];
  int index = 0;

  for (var harvest in historialHarvest) {
    index++;
    tableRows.add(
      TableRow(
        children: [
          _buildHarvest(context, harvest, farmLotId, index),
          _buildEstimates(harvest.estimates),
          _buildFinalReport(harvest.summaryFinalProduction,
              harvest.estimates, harvest.id, context, farmLotId, farmLotName),
        ],
      ),
    );
  }

  return tableRows;
}

Widget _buildHarvest(
    BuildContext context, HistoricHarvestModel harvest, String idFarmLot, int index) {
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
            dateOnly(harvest.evaluationStartDate),
            style: const TextStyle(fontSize: 16),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            dateOnly(harvest.evaluationEndDate),
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
                          AddTreeForm(idLot: idFarmLot, harvestId: harvest.id),
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

Widget _buildEstimates(List<EstimatesModel> estimates) {
  bool hasData = estimates.isNotEmpty;
  return TableCell(
    child: hasData
        ? ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: estimates.length,
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
                        Text(dateOnly(estimate.date)),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(FlutterIcons.tree_ent, color: Colors.green),
                        const SizedBox(width: 8),
                        Text('${estimate.totalFruitsEstimates} Frutos'),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(FlutterIcons.boxes_faw5s,
                            color: Colors.green),
                        const SizedBox(width: 8),
                        Text('${estimate.estimatedProduction} Kg'),
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
    FinalProductionModel finalReport,
    List<EstimatesModel> estimates,
    String harvestId,
    BuildContext context,
    String farmLotId,
    String farmLotName) {
  if (finalReport.id == "000000000000000000000000") {
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

  List<String> ids = estimates.map((element) => element.id.toString()).toList();
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
            Text(dateOnly(finalReport.date)),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(FlutterIcons.tree_ent, color: Colors.green),
            const SizedBox(width: 8),
            Text('${finalReport.totalProduction} Kg'),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(FlutterIcons.earth_ant, color: Colors.green),
            const SizedBox(width: 8),
            Text('${finalReport.exportMarket} Kg'),
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
                      idEstimates: ids, idFinalProduction: finalReport.id),
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
