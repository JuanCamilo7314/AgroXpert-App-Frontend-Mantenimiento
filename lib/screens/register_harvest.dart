import 'package:agroxpert/helpers/functions/inputs.dart';
import 'package:flutter/material.dart';

import '../helpers/config_forms/register-harvest/structure.dart';

class HarvestRegister extends StatefulWidget {
  final String farmLotId;
  const HarvestRegister({super.key, required this.farmLotId});

  @override
  State<HarvestRegister> createState() => _HarvestRegisterState();
}

class _HarvestRegisterState extends State<HarvestRegister> {
  final _formKey = GlobalKey<FormState>();
  final _nameLotController = TextEditingController();
  final _slectedHarvestTypeController = TextEditingController();
  String? _selectedOption;
  final _evaluationStartDateController = TextEditingController();
  final _evaluationEndDateController = TextEditingController();

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
                const SizedBox(height: 16.0),
                createSelectInput(
                    harvestType(_slectedHarvestTypeController, _selectedOption),
                    (String? newVAlue) {
                  setState(() {
                    _selectedOption = newVAlue;
                    _slectedHarvestTypeController.text = newVAlue!;
                  });
                }),
                const SizedBox(height: 16.0),
                createDateInputForInit(
                    initialDate(_evaluationStartDateController),
                    _evaluationEndDateController,
                    context),
                createDateInputForEnd(finalDate(_evaluationEndDateController),
                    _evaluationStartDateController, context),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: FloatingActionButton(
                    onPressed: _saveHarvest,
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

  _saveHarvest() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Lote creado con éxito')),
      );
    }
  }
}
