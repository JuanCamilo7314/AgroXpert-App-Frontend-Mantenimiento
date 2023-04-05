// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'DetallesEstimacion.dart';

List<Map<String, dynamic>> datos = [
  {
    'idCosecha': 1,
    'tipoCosecha': 'Cosecha 1',
    'fechaInicio': '2022-01-01',
    'fechaFin': '2022-01-15',
    'estimaciones': [
      {
        'idEstimacion': 1,
        'fecha': '2022-01-03',
        'arbolesEvaluados': [
          {'numFrutas': 20, 'numQuartiles': 5},
          {'numFrutas': 15, 'numQuartiles': 3},
          {'numFrutas': 25, 'numQuartiles': 6},
        ],
        'numArboles': 50,
        'totalFrutasEstimadas': 1500,
        'promedioFrutas': 30,
        'produccionEstimada': 45000,
      },
      {
        'idEstimacion': 2,
        'fecha': '2022-01-08',
        'arbolesEvaluados': [
          {'numFrutas': 18, 'numQuartiles': 4},
          {'numFrutas': 22, 'numQuartiles': 5},
          {'numFrutas': 20, 'numQuartiles': 6},
        ],
        'numArboles': 60,
        'totalFrutasEstimadas': 1800,
        'promedioFrutas': 30,
        'produccionEstimada': 54000,
      },
    ],
  },
  {
    'idCosecha': 2,
    'tipoCosecha': 'Cosecha 2',
    'fechaInicio': '2022-02-01',
    'fechaFin': '2022-02-15',
    'estimaciones': [
      {
        'idEstimacion': 3,
        'fecha': '2022-02-03',
        'arbolesEvaluados': [
          {'numFrutas': 16, 'numQuartiles': 4},
          {'numFrutas': 20, 'numQuartiles': 5},
          {'numFrutas': 18, 'numQuartiles': 6},
        ],
        'numArboles': 50,
        'totalFrutasEstimadas': 1500,
        'promedioFrutas': 30,
        'produccionEstimada': 45000,
      },
      {
        'idEstimacion': 4,
        'fecha': '2022-02-08',
        'arbolesEvaluados': [
          {'numFrutas': 22, 'numQuartiles': 5},
          {'numFrutas': 18, 'numQuartiles': 4},
          {'numFrutas': 24, 'numQuartiles': 6},
        ],
        'numArboles': 60,
        'totalFrutasEstimadas': 1800,
        'promedioFrutas': 30,
        'produccionEstimada': 54000,
      },
    ],
  },
];

void _verDetalles(BuildContext context, List<String> estimaciones) {
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => DetallesEstimacion(estimaciones: estimaciones)),
  );
}

/*
List<Map<String, dynamic>> datos = [
  {
    'cosecha': 'Cosecha 1',
    'estimaciones': 'Estimacion 1, Estimacion 2',
    'estimacionFinal': 'Estimacion final 1',
  },
  {
    'cosecha': 'Cosecha 2',
    'estimaciones': 'Estimacion 3, Estimacion 4',
    'estimacionFinal': 'Estimacion final 2',
  },
];


void _verDetalles(BuildContext context, String estimacion) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => DetallesEstimacion(id: estimacion)),
  );
}


// Función que abre la pantalla de detalles
void _verDetalles(BuildContext context, String idEstimacion) {
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => DetallesEstimacion(id: idEstimacion)),
  );
}


*/

class EjemploVista2 extends StatelessWidget {
  const EjemploVista2({Key? key}) : super(key: key);

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
                        child: Text(dato['idCosecha']),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () => _verDetalles(
                              context, dato['estimaciones'].split(', ')),
                          child: Text(dato['estimaciones']),
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
            height: 300.0,
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
