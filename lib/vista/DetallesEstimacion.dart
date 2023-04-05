import 'package:flutter/material.dart';

class DetallesEstimacion extends StatelessWidget {
  //final String id;
  final List<String> estimaciones;

  const DetallesEstimacion({Key? key, required this.estimaciones})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de la cosecha y sus estimaciones'
            'Detalles de la cosecha y sus estimaciones'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Aquí podrías mostrar los detalles de la estimación con el estimacion indicado
            Text(
              'Estimación',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Otros widgets con los detalles de la estimación
          ],
        ),
      ),
    );
  }
}
