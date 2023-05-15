import 'dart:math';
import 'package:agroxpert/models/estimates_model.dart';
import 'package:flutter/material.dart';
import '../services/estimation_api.dart';
import '../screens/historial_harvest.dart';

class AddTreeForm extends StatefulWidget {
  final String harvestId;
  final String idLot;
  final String farmLotName;
  const AddTreeForm(
      {super.key, required this.harvestId, required this.idLot, required this.farmLotName});

  @override
  State<AddTreeForm> createState() => _AddTreeFormState();
}

class _AddTreeFormState extends State<AddTreeForm> {
  final _formKey = GlobalKey<FormState>();
  final _quartilesController = TextEditingController();
  final _numeroFrutasController = TextEditingController();

  List<TreesAssessed> _trees = [];

  void _agregarArbol() {
    if (_formKey.currentState!.validate()) {
      TreesAssessed tree = TreesAssessed(
        numQuartiles: int.parse(_quartilesController.text),
        numFruits: int.parse(_numeroFrutasController.text),
      );
      setState(() {
        _trees.add(tree);
      });
      _quartilesController.clear();
      _numeroFrutasController.clear();
    }
  }

  void _enviarPeticion() {
    var response = createEstimation(widget.idLot, widget.harvestId, _trees);

    response.then((value) => {
          if (value == true)
            {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Estimación creada con exito')),
              ),
              Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HistoricHarvest(farmLotId: widget.idLot, farmLotName: widget.farmLotName),
                        ),)
            }
          else
            {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Error al crear el estimación')),
              )
            }
        });
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar árbol'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _quartilesController,
                decoration: const InputDecoration(
                  labelText: 'Número de quartiles',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor ingresa el número de quartiles';
                  } else if (!RegExp(r'^\d+$').hasMatch(value)) {
                    return 'El número de quartiles debe contener solo números';
                  } else if (int.parse(value) <= 0 || int.parse(value) > 4) {
                    return 'El número de quartiles debe ser mayor a 0 y menor o igual a 4';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _numeroFrutasController,
                decoration: const InputDecoration(
                  labelText: 'Número de frutas',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor ingresa el número de frutas';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Ingresa un número válido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _agregarArbol,
                child: const Text('Agregar'),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _enviarPeticion,
                child: const Text('Guardar Cambios'),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Lista de árboles',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              Expanded(
                child: ListView.builder(
                  itemCount: _trees.length,
                  itemBuilder: (context, index) {
                    TreesAssessed tree = _trees[index];
                    return ListTile(
                      title: Text(
                          'Arbol # ${index + 1}, Número de quartiles: ${tree.numQuartiles}, Número de frutas: ${tree.numFruits}'),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
