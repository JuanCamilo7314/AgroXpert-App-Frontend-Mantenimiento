import 'package:flutter/material.dart';

class DetallesEstimacion extends StatelessWidget {
  final String id;

  const DetallesEstimacion({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de la estimación $id'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Aquí podrías mostrar los detalles de la estimación con el estimacion indicado
            Text(
              'Detalles de la estimación $id',
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
