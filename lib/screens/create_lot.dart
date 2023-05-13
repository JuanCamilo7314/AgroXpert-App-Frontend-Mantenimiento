import 'package:agroxpert/helpers/config_forms/create-lots/validations.dart';
import 'package:agroxpert/models/farm_lot_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../helpers/config_forms/create-lots/structure.dart';
import '../helpers/functions/inputs.dart';
import '../models/InputModelForm.dart';
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
  final _nameLotController = TextEditingController();
  final _numberTreesController = TextEditingController();
  final _ageTreesController = TextEditingController();
  final _primaryInitialDateController = TextEditingController();
  final _primaryFinalDateController = TextEditingController();
  final _secondaryInitialDateController = TextEditingController();
  final _secondaryFinalDateController = TextEditingController();
  final _averageFruitWeightController = TextEditingController();
  final _dateComplement = ' 00:00:00.000';

  @override
  void dispose() {
    _nameLotController.dispose();
    _numberTreesController.dispose();
    _ageTreesController.dispose();
    _primaryInitialDateController.dispose();
    _primaryFinalDateController.dispose();
    _secondaryInitialDateController.dispose();
    _secondaryFinalDateController.dispose();
    _averageFruitWeightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear Lote'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                createTextInput(nameLot(_nameLotController)),
                createIntegerInput(
                  numberTrees(_numberTreesController),
                ),
                createDoubleInput(
                  treesAge(_ageTreesController),
                ),
                const SizedBox(height: 16.0),
                Container(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Column(
                    children: [
                      Text('Fechas de producción',
                          style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(height: 16.0),
                      Text('Producción Primaria',
                          style: Theme.of(context).textTheme.titleSmall),
                      createDateInputForInit(
                          initialDate(_primaryInitialDateController),
                          _primaryFinalDateController,
                          context),
                      createDateInputForEnd(
                          finalDate(_primaryFinalDateController),
                          _primaryInitialDateController,
                          context),
                      const SizedBox(height: 16.0),
                      Text('Producción Secundaria',
                          style: Theme.of(context).textTheme.titleSmall),
                      createDateInputForInit(
                          initialDate(_secondaryInitialDateController),
                          _secondaryFinalDateController,
                          context),
                      createDateInputForEnd(
                          finalDate(_secondaryFinalDateController),
                          _secondaryInitialDateController,
                          context),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
                createDoubleInput(
                  averageFruitWeight(_averageFruitWeightController),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: FloatingActionButton(
                    onPressed: _saveLot,
                    child: const Text('Crear'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _saveLot() {
    if (_formKey.currentState!.validate()) {
      ProductionDate productionDate = ProductionDate(
        primary: Production(
            initial: DateTime.parse(
                _primaryInitialDateController.text + _dateComplement),
            theFinal: DateTime.parse(
                _primaryFinalDateController.text + _dateComplement)),
        secondary: Production(
            initial: DateTime.parse(
                _secondaryInitialDateController.text + _dateComplement),
            theFinal: DateTime.parse(
                _secondaryFinalDateController.text + _dateComplement)),
      );

      FarmLotModel lote = FarmLotModel(
          id: "",
          nameLot: _nameLotController.text,
          numberTrees: int.parse(_numberTreesController.text),
          treesAge: double.parse(_ageTreesController.text),
          averageFruitWeight: double.parse(_averageFruitWeightController.text),
          productionDate: productionDate);
      // Aquí se puede hacer lo que sea necesario con el objeto lote creado, como enviarlo a una base de datos, etc.

      //mostrar por consola el objeto lote creado
      print(lote.toJson());

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Lote creado con éxito')),
      );
    }
  }
}
