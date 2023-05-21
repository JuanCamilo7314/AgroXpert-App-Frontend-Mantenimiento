import 'package:agroxpert/models/final_production_model.dart';
import 'package:agroxpert/screens/historial_harvest.dart';
import 'package:agroxpert/services/final_report_api.dart';
import 'package:agroxpert/widgets/caliber_division.dart';
import 'package:flutter/material.dart';
import '../helpers/functions/inputs.dart';
// import '../services/farm_lot_api.dart';
import 'package:flutter_icons/flutter_icons.dart';
import '../helpers/config_forms/create_final_report/final_report_estructure.dart';

class CreateFinalReportScreen extends StatefulWidget {
  final String farmLotId;
  final String farmLotName;
  final String harvetsId;
  const CreateFinalReportScreen(
      {super.key,
      required this.harvetsId,
      required this.farmLotId,
      required this.farmLotName});

  @override
  State<CreateFinalReportScreen> createState() => _CreateFinalReportScreen();
}

class _CreateFinalReportScreen extends State<CreateFinalReportScreen> {
  final _formKey = GlobalKey<FormState>();
  final _dateController = TextEditingController();
  final _totalProductionController = TextEditingController();
  final _exportMarketController = TextEditingController();
  final _nationalMarketController = TextEditingController();
  final _wasteController = TextEditingController();
  final _dateComplement = ' 00:00:00.000';
  bool _isLoading = false;
  final List<CaliberDivision> _calibersDivision = [];

  @override
  void dispose() {
    _dateController.dispose();
    _totalProductionController.dispose();
    _exportMarketController.dispose();
    _nationalMarketController.dispose();
    _wasteController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear Reporte Final'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                createDateInput(
                  dateFinalProduction(_dateController),
                  context,
                ),
                createIntegerInput(
                  totalProduction(_totalProductionController),
                ),
                createIntegerInput(
                  exportMarket(_exportMarketController),
                ),
                createIntegerInput(
                  nationalMarket(_nationalMarketController),
                ),
                createIntegerInput(
                  waste(_wasteController),
                ),
                const SizedBox(
                  height: 20,
                ),
                CreateCaliberDivision(
                  caliberDivision: _calibersDivision,
                ),
                const SizedBox(height: 16.0),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: FloatingActionButton(
                    onPressed: _saveFinalProduction,
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

  Future<void> _saveFinalProduction() async {
    if (_formKey.currentState!.validate()) {
      FinalProductionModel finalProduction = FinalProductionModel(
        id: '',
        date: DateTime.parse(_dateController.text + _dateComplement),
        totalProduction: int.parse(_totalProductionController.text),
        exportMarket: int.parse(_exportMarketController.text),
        nationalMarket: int.parse(_nationalMarketController.text),
        waste: int.parse(_wasteController.text),
        caliberDivision: _calibersDivision,
      );

      var request = createFinalProduction(finalProduction, widget.harvetsId);

      request.then((value) => {
            if (value == true)
              {
                _isLoading = false,
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Reporte final creado con éxito')),
                ),
                Navigator.pop(context)
              }

            //Si es falso se muestra el mensaje de error
            else
              {
                _isLoading = false,
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Error al crear el reporte final')),
                )
              }
          });
    }
  }
}
