// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'DetallesEstimacion.dart';

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

// Función que abre la pantalla de detalles
void _verDetalles(BuildContext context, String idEstimacion) {
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => DetallesEstimacion(id: idEstimacion)),
  );
}

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
                        child: Text(dato['cosecha']),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () => _verDetalles(context, 'Estimacion 1'),
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
