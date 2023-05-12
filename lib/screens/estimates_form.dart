import 'package:agroxpert/models/estimates_model.dart';
import 'package:flutter/material.dart';

class AddTreeForm extends StatefulWidget {
  @override
  _AddTreeFormState createState() => _AddTreeFormState();
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

  @override
  Widget build(BuildContext context) {
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
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _agregarArbol,
                child: const Text('Agregar'),
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
                          'Arbol # ${index+1}, Número de quartiles: ${tree.numQuartiles}, Número de frutas: ${tree.numFruits}'),
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
