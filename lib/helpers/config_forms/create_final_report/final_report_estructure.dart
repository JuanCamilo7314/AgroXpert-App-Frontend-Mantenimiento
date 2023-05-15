import 'package:agroxpert/helpers/config_forms/create_final_report/validations.dart';
import 'package:agroxpert/models/InputModelForm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

InputModel dateFinalProduction(TextEditingController controller) {
  return InputModel(
    text: 'Fecha final de producción',
    controller: controller,
    icon: FlutterIcons.calendar_edit_mco,
    validator: validateFinalDate,
  );
}

// falta validacion
InputModel totalProduction(TextEditingController controller) {
  return InputModel(
    text: 'Producción total en kilogramos',
    controller: controller,
    icon: FlutterIcons.weight_kilogram_mco,
    validator: validateTotalProduction,
  );
}

InputModel exportMarket(TextEditingController controller) {
  return InputModel(
    text: 'Total exportado en kilogramos',
    controller: controller,
    icon: FlutterIcons.earth_ant,
    validator: validateExportMarket,
  );
}

InputModel nationalMarket(TextEditingController controller) {
  return InputModel(
      text: 'Total mercado nacional en kilogramos',
      controller: controller,
      icon: FlutterIcons.earth_mco,
      validator: validateNationalMarket);
}

InputModel waste(TextEditingController controller) {
  return InputModel(
      text: 'Total de desechado en kilogramos',
      controller: controller,
      icon: FlutterIcons.trash_2_fea,
      validator: validateWaste);
}

InputModel category(TextEditingController controller) {
  return InputModel(
      text: 'Categoría',
      controller: controller,
      icon: FlutterIcons.type_fea,
      validator: validateCategory);
}

InputModel quantity(TextEditingController controller) {
  return InputModel(
      text: 'Cantidad',
      controller: controller,
      icon: FlutterIcons.format_list_numbered_rtl_mco,
      validator: validateQuantity);
}
