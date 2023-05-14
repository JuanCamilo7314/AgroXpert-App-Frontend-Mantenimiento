import 'package:agroxpert/helpers/functions/inputs.dart';
import 'package:agroxpert/models/create_harvest_model.dart';
import 'package:agroxpert/screens/historial_harvest.dart';
import 'package:agroxpert/services/harvest_api.dart';
import 'package:flutter/material.dart';

import '../helpers/config_forms/register-harvest/structure.dart';

class HarvestRegister extends StatefulWidget {
  final String farmLotId;
  final String farmLotName;
  const HarvestRegister(
      {super.key, required this.farmLotId, required this.farmLotName});

  @override
  State<HarvestRegister> createState() => _HarvestRegisterState();
}

class _HarvestRegisterState extends State<HarvestRegister> {
  final _formKey = GlobalKey<FormState>();
  final _nameLotController = TextEditingController();
  final _selectedHarvestTypeController = TextEditingController();
  String? _selectedOption;
  final _evaluationStartDateController = TextEditingController();
  final _evaluationEndDateController = TextEditingController();
  final _dateComplement = ' 00:00:00.000';
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    _nameLotController.text = widget.farmLotName;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registar Cosecha'),
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
                    harvestType(
                        _selectedHarvestTypeController, _selectedOption),
                    (String? newVAlue) {
                  setState(() {
                    _selectedOption = newVAlue;
                    _selectedHarvestTypeController.text = newVAlue!;
                  });
                }),
                const SizedBox(height: 16.0),
                createDateInputForInit(
                    initialDate(_evaluationStartDateController),
                    _evaluationEndDateController,
                    context),
                createDateInputForEnd(finalDate(_evaluationEndDateController),
                    _evaluationStartDateController, context),
                const SizedBox(
                  height: 16.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Stack(
                    children: [
                      Container(
                          alignment: Alignment.center,
                          child: ElevatedButton(
                            onPressed: _isLoading
                                ? null
                                : () => _saveHarvest(
                                    widget.farmLotId, widget.farmLotName),
                            child: const Text('Crear'),
                          )),
                      if (_isLoading)
                        Positioned.fill(
                          child: Container(
                            color: Colors.black.withOpacity(0.5),
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _saveHarvest(String farmLotId, String farmLotName) async {
    if (_formKey.currentState!.validate()) {
      if (_selectedHarvestTypeController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Seleccione un tipo de cosecha')),
        );
        return;
      }

      CreateHarvest newHarvest = CreateHarvest(
          type: _selectedHarvestTypeController.text,
          idFarmLot: widget.farmLotId,
          evaluationStartDate: DateTime.parse(
              _evaluationStartDateController.text + _dateComplement),
          evaluationEndDate: DateTime.parse(
              _evaluationEndDateController.text + _dateComplement));

      print(newHarvest.toJson());

      _isLoading = true;
      var response = createHarvest(newHarvest);

      response.then((value) => {
            //Si es verdadero se muestra el mensaje de éxito y vuleve la pantalla anterior
            if (value == true)
              {
                _isLoading = false,
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Cosecha creado con éxito')),
                ),
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HistoricHarvest(
                              farmLotId: farmLotId,
                              farmLotName: farmLotName,
                            )))
              }

            //Si es falso se muestra el mensaje de error
            else
              {
                _isLoading = false,
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Error al crear el lote')),
                )
              }
          });
    }
  }
}
