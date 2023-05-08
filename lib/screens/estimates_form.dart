import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:agroxpert/utils/date_convert.dart';

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  final _numArbolesController = TextEditingController();
  final _totalFrutasController = TextEditingController();
  final _promFrutasController = TextEditingController();
  final _prodEstimadaController = TextEditingController();

  @override
  void dispose() {
    _numArbolesController.dispose();
    _totalFrutasController.dispose();
    _promFrutasController.dispose();
    _prodEstimadaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Estimar Producción'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Ingresar datos de estimación',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                child: TextFormField(
                  controller: _numArbolesController,
                  decoration: InputDecoration(
                    labelText: 'Número de árboles',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Por favor, ingrese el número de árboles';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                child: TextFormField(
                  controller: _totalFrutasController,
                  decoration: InputDecoration(
                    labelText: 'Total de frutas estimadas',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Por favor, ingrese el total de frutas estimadas';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                child: TextFormField(
                  controller: _promFrutasController,
                  decoration: InputDecoration(
                    labelText: 'Promedio de frutas estimadas',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Por favor, ingrese el promedio de frutas estimadas';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                child: TextFormField(
                  controller: _prodEstimadaController,
                  decoration: InputDecoration(
                    labelText: 'Producción estimada',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Por favor, ingrese la producción estimada';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Aquí puedes agregar la lógica para manejar el evento de presionar el botón
                  },
                  child: Text('Agregar Estimación'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
