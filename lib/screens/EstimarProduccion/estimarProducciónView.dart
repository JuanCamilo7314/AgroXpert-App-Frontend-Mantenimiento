import 'package:flutter/material.dart';

class MyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Estimar Producción'),
      ),
      body: Container(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Table(
                children: [
                  TableRow(
                    decoration: const BoxDecoration(
                      color: Colors.orange,
                    ),
                    children: [
                      TableCell(
                        child: Container(
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Arbol 1',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Arbol 2',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Arbol 3',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    decoration: BoxDecoration(
                      color: Colors.orange.withAlpha(50),
                    ),
                    children: const [
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('numFruits: 20'),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('numFruits: 15'),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('numFruits: 25'),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    decoration: BoxDecoration(
                      color: Colors.orange.withAlpha(50),
                    ),
                    children: const [
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('numQuartiles: 5'),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('numQuartiles: 3'),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('numQuartiles: 6'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20), // espacio en blanco
            const Text(
              'Total frutas estimadas: ', // texto que deseas agregar
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 20), // espacio en blanco
            const Text(
              'Edad Frutas: ', // texto que deseas agregar
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 20), // espacio en blanco
            const Text(
              'Promedio Frutas: ', // texto que deseas agregar
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 50), // espacio en blanco
            const Text(
              'Estimación de Produccion: ', // texto que deseas agregar
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                
              ),
            ),
          ],
        ),
      ),
    );
  }
}
