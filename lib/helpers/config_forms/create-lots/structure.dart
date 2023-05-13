import 'package:agroxpert/helpers/config_forms/create-lots/validations.dart';
import 'package:agroxpert/models/InputModelForm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

InputModel nameLot(TextEditingController controller) {
  return InputModel(
    text: 'Nombre del lote',
    controller: controller,
    icon: FlutterIcons.edit_ant,
    validator: validateName,
  );
}

InputModel numberTrees(TextEditingController controller) {
  return InputModel(
    text: 'Número de árboles',
    controller: controller,
    icon: FlutterIcons.tree_outline_mco,
    validator: validateNumberTrees,
  );
}

InputModel treesAge(TextEditingController controller) {
  return InputModel(
    text: 'Edad de los árboles',
    controller: controller,
    icon: FlutterIcons.tree_outline_mco,
    validator: validateTreesAge,
  );
}

InputModel initialDate(TextEditingController controller) {
  return InputModel(
      text: 'Fecha inicial',
      controller: controller,
      icon: FlutterIcons.calendar_edit_mco,
      validator: validateInitialDate);
}

InputModel finalDate(TextEditingController controller) {
  return InputModel(
      text: 'Fecha Final',
      controller: controller,
      icon: FlutterIcons.calendar_edit_mco,
      validator: validateInitialDate);
}

InputModel averageFruitWeight(TextEditingController controller) {
  return InputModel(
    text: 'Peso promedio de fruto en gramos',
    controller: controller,
    icon: FlutterIcons.weight_gram_mco,
    validator: validateAverageFruitWeight,
  );
}
