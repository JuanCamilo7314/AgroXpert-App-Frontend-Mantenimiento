import 'package:flutter/material.dart';

class DetallesEstimacion extends StatelessWidget {
  final List<Map<String, dynamic>> estimaciones;

  const DetallesEstimacion({Key? key, required this.estimaciones})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de las estimaciones'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: estimaciones.length,
          itemBuilder: (context, index) {
            final estimacion = estimaciones[index];

            return Card(
              child: ExpansionTile(
                title: Text('Estimación ${estimacion['idEstimates']}'),
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('Fecha: ${estimacion['date']}'),
                      Text('Arboles evaluados:'),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: estimacion['treesAssessed'].length,
                        itemBuilder: (BuildContext context, int index) {
                          final treeAssessed =
                              estimacion['treesAssessed'][index];
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Árbol ${index + 1}'),
                                  Text(
                                      'Número de frutas: ${treeAssessed['numFruits']}'),
                                  Text(
                                      'Número de cuartiles: ${treeAssessed['numQuartiles']}'),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      Text('Numero de arboles: ${estimacion['numTrees']}'),
                      Text(
                          'Total de frutas estimadas: ${estimacion['totalFruitsEstimates']}'),
                      Text(
                          'Promedio de frutas: ${estimacion['averageFruits']}'),
                      Text(
                          'Producion estimada: ${estimacion['estimatedProduction']}'),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
