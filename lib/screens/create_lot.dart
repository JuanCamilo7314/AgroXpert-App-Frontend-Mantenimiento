import 'package:agroxpert/models/farm_lot_model.dart';
import 'package:flutter/material.dart';

import '../widgets/card_lots.dart';
import '../services/estimation_api.dart';
// import '../services/farm_lot_api.dart';
import 'package:flutter_icons/flutter_icons.dart';

class CreateLotScreen extends StatefulWidget {
  const CreateLotScreen({super.key});

  @override
  State<CreateLotScreen> createState() => _CreateLotScreenState();
}

class _CreateLotScreenState extends State<CreateLotScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _numArbolesController = TextEditingController();
  final _edadArbolesController = TextEditingController();
  final _fechaInicialPrimariaController = TextEditingController();
  final _fechaFinalPrimariaController = TextEditingController();
  final _fechaInicialSecundariaController = TextEditingController();
  final _fechaFinalSecundariaController = TextEditingController();
  final _pesoPromedioController = TextEditingController();

  @override
  void dispose() {
    _nombreController.dispose();
    _numArbolesController.dispose();
    _edadArbolesController.dispose();
    _fechaInicialPrimariaController.dispose();
    _fechaFinalPrimariaController.dispose();
    _fechaInicialSecundariaController.dispose();
    _fechaFinalSecundariaController.dispose();
    _pesoPromedioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crear Lote'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  controller: _nombreController,
                  decoration: InputDecoration(labelText: 'Nombre del lote'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor ingrese un nombre';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _numArbolesController,
                  decoration: InputDecoration(
                      labelText: 'Número de árboles',
                      prefixIcon: Icon(FlutterIcons.tree_ent)),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor ingrese un número';
                    }
                    if (int.tryParse(value!) == null) {
                      return 'Por favor ingrese un número válido';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _edadArbolesController,
                  decoration: InputDecoration(
                      labelText: 'Edad de los árboles',
                      prefixIcon: Icon(FlutterIcons.calendar_ant)),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor ingrese una edad';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Por favor ingrese un número válido';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                Text('Fechas de producción',
                    style: Theme.of(context).textTheme.titleMedium),
                SizedBox(height: 16.0),
                Text('Producción Primaria',
                    style: Theme.of(context).textTheme.titleSmall),
                TextFormField(
                  controller: _fechaInicialPrimariaController,
                  decoration: InputDecoration(labelText: 'Fecha inicial'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, introduce la fecha inicial';
                    }
                    return null;
                  },
                  onTap: () async {
                    final selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now().subtract(Duration(days: 365)),
                      lastDate: DateTime.now(),
                    );
                    if (selectedDate != null) {
                      _fechaInicialPrimariaController.text =
                          selectedDate.toString();
                    }
                  },
                ),
                TextFormField(
                  controller: _fechaFinalPrimariaController,
                  decoration: InputDecoration(labelText: 'Fecha final'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, introduce la fecha final';
                    }
                    return null;
                  },
                  onTap: () async {
                    final selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now().subtract(Duration(days: 365)),
                      lastDate: DateTime.now(),
                    );
                    if (selectedDate != null) {
                      _fechaFinalPrimariaController.text =
                          selectedDate.toString();
                    }
                  },
                ),
                SizedBox(height: 16.0),
                Text('Producción Secundaria',
                    style: Theme.of(context).textTheme.titleSmall),
                TextFormField(
                  controller: _fechaInicialSecundariaController,
                  decoration: InputDecoration(labelText: 'Fecha inicial'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, introduce la fecha inicial';
                    }
                    return null;
                  },
                  onTap: () async {
                    final selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now().subtract(Duration(days: 365)),
                      lastDate: DateTime.now(),
                    );
                    if (selectedDate != null) {
                      _fechaInicialSecundariaController.text =
                          selectedDate.toString();
                    }
                  },
                ),
                TextFormField(
                  controller: _fechaFinalSecundariaController,
                  decoration: InputDecoration(labelText: 'Fecha final'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, introduce la fecha final';
                    }
                    return null;
                  },
                  onTap: () async {
                    final selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now().subtract(Duration(days: 365)),
                      lastDate: DateTime.now(),
                    );
                    if (selectedDate != null) {
                      _fechaFinalSecundariaController.text =
                          selectedDate.toString();
                    }
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _pesoPromedioController,
                  decoration: InputDecoration(
                      labelText: 'Peso promedio de los árboles',
                      prefixIcon: Icon(FlutterIcons.scale_balance_mco)),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor ingrese un peso promedio';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Por favor ingrese un número válido';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: FloatingActionButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ProductionDate productionDate = ProductionDate(
                          primary: Production(
                              initial: DateTime.parse(
                                  _fechaInicialPrimariaController.text),
                              theFinal: DateTime.parse(
                                  _fechaFinalPrimariaController.text)),
                          secondary: Production(
                              initial: DateTime.parse(
                                  _fechaInicialSecundariaController.text),
                              theFinal: DateTime.parse(
                                  _fechaFinalSecundariaController.text)),
                        );

                        FarmLotModel lote = FarmLotModel(
                            id: "",
                            nameLot: _nombreController.text,
                            numberTrees: int.parse(_numArbolesController.text),
                            treesAge: double.parse(_edadArbolesController.text),
                            averageFruitWeight:
                                double.parse(_pesoPromedioController.text),
                            productionDate: productionDate);
                        // Aquí se puede hacer lo que sea necesario con el objeto lote creado, como enviarlo a una base de datos, etc.

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Lote creado con éxito')),
                        );
                      }
                    },
                    child: Text('Crear'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
