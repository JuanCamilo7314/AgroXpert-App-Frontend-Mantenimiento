// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'details_estimates.dart';
import '../services/harvest_api.dart';
import 'package:agroxpert/models/historic_harvest_model.dart';


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
        title: Text('Historial de estimaciones'),
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
            final datos = snapshot.data as List<HistoricHarvestModel>;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Tabla
                Container(
                  padding: EdgeInsets.all(10),
                  child: Table(
                    columnWidths: {
                      0: FlexColumnWidth(2),
                      1: FlexColumnWidth(2),
                      2: FlexColumnWidth(2),
                    },
                    border: TableBorder.all(width: 1.0),
                    children: [
                      TableRow(
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColorLight,
                        ),
                        children: [
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
                      ),
                      for (var dato in datos)
                        TableRow(
                          children: [
                            TableCell(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child:
                                    Text('Cosecha ${datos.indexOf(dato) + 1}'),
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                /*child: GestureDetector(
                          onTap: () => _verDetalles(context, dato['estimates']),
                          child: Text(dato['estimates']),
                        ),*/
                                child: GestureDetector(
                                  onTap: () => Navigator.pushNamed(
                                      context, '/estimates_production'),

                                  //_verDetalles(context, dato['estimates']),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      /*Text(
                                'Estimaciones:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),*/
                                      ListView.builder(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: dato.estimates.length ?? 0,
                                        itemBuilder: (context, index) {
                                          final estimate =
                                              dato.estimates[index];
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8.0),
                                            child: GestureDetector(
                                              //onTap: () => _verDetalles(context, datos['estimates']),
                                              child: Text(estimate.id ??
                                                  'Estimation ID not found'),
                                            ),
                                          );
                                        },
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(dato.finalProduction.id),
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
                // Gráfico
                // Container(
                //   height: 150.0,
                //   padding: EdgeInsets.all(16.0),
                //   child: Placeholder(),
                // ),
                // Botón
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Acción que se ejecuta al pulsar el botón
                    },
                    child: Text('Estimar produccion'),
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
