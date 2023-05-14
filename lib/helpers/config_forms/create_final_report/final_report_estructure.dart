import 'package:agroxpert/helpers/config_forms/create-lots/validations.dart';
import 'package:agroxpert/models/InputModelForm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

InputModel dateFinalProduction(TextEditingController controller) {
  return InputModel(
    text: 'Fecha final de producción',
    controller: controller,
    icon: FlutterIcons.calendar_edit_mco,
    validator: validateInitialDate,
  );
}

// falta validacion
InputModel totalProduction(TextEditingController controller) {
  return InputModel(
    text: 'Producción total en kilogramos', 
    controller: controller,
    icon: FlutterIcons.weight_gram_mco,
    validator: validateNumberFinalProduction,
  );
}

InputModel exportMarket(TextEditingController controller) {
  return InputModel(
    text: 'Total exportado en kilogramos',
    controller: controller,
    icon: FlutterIcons.earth_ant,
    validator: validateNumberFinalProduction,
  );
}

InputModel nationalMarket(TextEditingController controller) {
  return InputModel(
      text: 'Total mercado nacional en kilogramos',
      controller: controller,
      icon: FlutterIcons.earth_mco,
      validator: validateNumberFinalProduction);
}

InputModel waste(TextEditingController controller) {
  return InputModel(
      text: 'Total de desechado en kilogramos',
      controller: controller,
      icon: FlutterIcons.trash_2_fea,
      validator: validateNumberFinalProduction);
}