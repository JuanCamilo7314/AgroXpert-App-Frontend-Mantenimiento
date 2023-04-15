// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'details_estimates.dart';

List<Map<String, dynamic>> datos = [
  {
    "idHarvest": "1",
    "cosecha": "Cosecha 1",
    "type": "primary",
    "idFarmLot": "L001",
    "evaluationStartDate": "2023-03-28",
    "evaluationEndDate": "2023-05-27",
    "estimates": [
      {
        "idEstimates": "1",
        "date": "2023-04-01",
        "treesAssessed": [
          {"numFruits": 20, "numQuartiles": 5},
          {"numFruits": 15, "numQuartiles": 3},
          {"numFruits": 25, "numQuartiles": 6}
        ],
        "numTrees": 10,
        "totalFruitsEstimates": 1500,
        "averageFruits": 30,
        "estimatedProduction": 45000
      },
      {
        "idEstimates": "2",
        "date": "2023-04-15",
        "treesAssessed": [
          {"numFruits": 20, "numQuartiles": 5},
          {"numFruits": 15, "numQuartiles": 3},
          {"numFruits": 8, "numQuartiles": 1},
          {"numFruits": 25, "numQuartiles": 6}
        ],
        "numTrees": 20,
        "totalFruitsEstimates": 2000,
        "averageFruits": 20,
        "estimatedProduction": 40000
      },
      {
        "idEstimates": "3",
        "date": "2023-05-25",
        "treesAssessed": [
          {"numFruits": 20, "numQuartiles": 5},
          {"numFruits": 35, "numQuartiles": 8},
          {"numFruits": 25, "numQuartiles": 6}
        ],
        "numTrees": 10,
        "totalFruitsEstimates": 1000,
        "averageFruits": 30,
        "estimatedProduction": 30000
      }
    ],
    "estimacionFinal": "EF001",
  },
  {
    "idHarvest": "2",
    "cosecha": "Cosecha 2",
    "type": "secundary",
    "idFarmLot": "L001",
    "evaluationStartDate": "2023-06-01",
    "evaluationEndDate": "2023-08-30",
    "estimates": [
      {
        "idEstimates": "4",
        "date": "2023-06-15",
        "treesAssessed": [
          {"numFruits": 20, "numQuartiles": 5},
          {"numFruits": 10, "numQuartiles": 1}
        ],
        "numTrees": 22,
        "totalFruitsEstimates": 500,
        "averageFruits": 15,
        "estimatedProduction": 7500
      },
      {
        "idEstimates": "5",
        "date": "2023-07-30",
        "treesAssessed": [
          {"numFruits": 20, "numQuartiles": 5},
          {"numFruits": 30, "numQuartiles": 5},
          {"numFruits": 20, "numQuartiles": 7}
        ],
        "numTrees": 30,
        "totalFruitsEstimates": 3000,
        "averageFruits": 25,
        "estimatedProduction": 75000
      }
    ],
    "estimacionFinal": "EF002",
  },
  {
    "idHarvest": "3",
    "cosecha": "Cosecha 3",
    "type": "secundary",
    "idFarmLot": "L001",
    "evaluationStartDate": "2023-05-01",
    "evaluationEndDate": "2023-05-30",
    "estimates ": [],
    "estimacionFinal": ""
  },
];

void _verDetalles(BuildContext context, List<Map<String, dynamic>> datos) {
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => DetallesEstimacion(estimaciones: datos)),
  );
}

class historial_harvest extends StatelessWidget {
  const historial_harvest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AGROXPERT'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Título
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Historial de estimaciones',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Tabla
          Table(
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
                        child: Text(dato['cosecha']),
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
                          onTap: () => _verDetalles(context, dato['estimates']),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                itemCount: dato['estimates']?.length ?? 0,
                                itemBuilder: (context, index) {
                                  final estimate = dato['estimates']?[index];
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: GestureDetector(
                                      //onTap: () => _verDetalles(context, datos['estimates']),
                                      child: Text(estimate?['idEstimates'] ??
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
                        child: Text(dato['estimacionFinal']),
                      ),
                    ),
                  ],
                ),
            ],
          ),

          // Gráfico
          Container(
            height: 150.0,
            padding: EdgeInsets.all(16.0),
            child: Placeholder(),
          ),
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
      ),
    );
  }
}
