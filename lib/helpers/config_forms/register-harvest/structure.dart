import 'package:agroxpert/helpers/config_forms/register-harvest/validations.dart';
import 'package:agroxpert/models/InputModelForm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

InputModel nameLot(TextEditingController controller) {
  return InputModel(
    text: 'Nombre del lote',
    controller: controller,
    icon: FlutterIcons.edit_ant,
    validator: validateName,
    enabled: false,
  );
}

InputModel harvestType(
    TextEditingController controller, String? selectedOption) {
  return InputModel(
    text: 'Tipo de cosecha',
    controller: controller,
    icon: FlutterIcons.tree_outline_mco,
    validator: validateHarvestType,
    selectedOption: selectedOption,
    options: ['Primaria', 'Secundaria'],
  );
}

InputModel initialDate(TextEditingController controller) {
  return InputModel(
      text: 'Fecha inicial de evaluación',
      controller: controller,
      icon: FlutterIcons.calendar_edit_mco,
      validator: validateInitialDate);
}

InputModel finalDate(TextEditingController controller) {
  return InputModel(
      text: 'Fecha final de evaluación',
      controller: controller,
      icon: FlutterIcons.calendar_edit_mco,
      validator: validateInitialDate);
}
