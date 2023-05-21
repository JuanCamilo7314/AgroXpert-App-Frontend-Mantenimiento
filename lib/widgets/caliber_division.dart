import 'package:agroxpert/helpers/config_forms/create_final_report/final_report_estructure.dart';
import 'package:agroxpert/helpers/functions/inputs.dart';
import 'package:agroxpert/models/final_production_model.dart';
import 'package:flutter/material.dart';

class CreateCaliberDivision extends StatefulWidget {
  final List<CaliberDivision> caliberDivision;
  const CreateCaliberDivision({super.key, required this.caliberDivision});

  @override
  State<CreateCaliberDivision> createState() => _CreateCaliberDivisionState();
}

class _CreateCaliberDivisionState extends State<CreateCaliberDivision> {
  final _formKey = GlobalKey<FormState>();

  final _categoryController = TextEditingController();
  final _quantiyController = TextEditingController();

  @override
  void dispose() {
    _categoryController.dispose();
    _quantiyController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'División por calibres',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey.shade700,
            ),
          ),
          createTextInput(
            category(_categoryController),
          ),
          createIntegerInput(
            quantity(_quantiyController),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: _addCaliberDivision,
            child: const Text('Agregar'),
          ),
          const SizedBox(height: 16.0),
          widget.caliberDivision.isEmpty
              ? const Text('No hay calibres agregados')
              : Text(
                  'Lista de calibres',
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey.shade700),
                ),
          const SizedBox(height: 16.0),
          ListView.builder(
            shrinkWrap: true,
            itemCount: widget.caliberDivision.length,
            itemBuilder: (context, index) {
              CaliberDivision calibre = widget.caliberDivision[index];
              return ListTile(
                title: Text(
                    'Arbol # ${index + 1}, Categoría: ${calibre.category}, Cantidad: ${calibre.quantity}'),
              );
            },
          ),
        ],
      ),
    );
  }

  void _addCaliberDivision() {
    if (_formKey.currentState!.validate()) {
      CaliberDivision caliberDivision = CaliberDivision(
        category: _categoryController.text,
        quantity: int.parse(_quantiyController.text),
      );

      setState(() {
        widget.caliberDivision.add(caliberDivision);
      });

      _categoryController.clear();
      _quantiyController.clear();
    }
  }
}
