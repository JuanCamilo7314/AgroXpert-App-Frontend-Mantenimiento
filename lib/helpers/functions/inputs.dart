import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../models/InputModelForm.dart';

const _dateComplement = ' 00:00:00.000';

Widget createTextInput(InputModel input) {
  return TextFormField(
      controller: input.controller,
      decoration:
          InputDecoration(labelText: input.text, prefixIcon: Icon(input.icon)),
      validator: (value) => input.validator(value!));
}

Widget createIntegerInput(InputModel input) {
  return TextFormField(
      controller: input.controller,
      decoration:
          InputDecoration(labelText: input.text, prefixIcon: Icon(input.icon)),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\d*\,?\.?\d*$')),
      ],
      keyboardType: TextInputType.number,
      validator: (value) => input.validator(value!));
}

Widget createDoubleInput(InputModel input) {
  return TextFormField(
      controller: input.controller,
      decoration:
          InputDecoration(labelText: input.text, prefixIcon: Icon(input.icon)),
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      //permitir solo numeros
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\d*\,?\.?\d*$')),
      ],
      validator: (value) => input.validator(value!));
}

Widget createDateInputForInit(InputModel input,
    TextEditingController finalDateController, BuildContext context) {
  return TextFormField(
    keyboardType: TextInputType.datetime,
    inputFormatters: <TextInputFormatter>[
      FilteringTextInputFormatter.allow(RegExp(r'^\d\d\/\d\d\/\d\d\d\d$')),
    ],
    controller: input.controller,
    decoration: InputDecoration(
        labelText: input.text,
        hintText: 'yyyy-mm-dd',
        prefixIcon: Icon(input.icon)),
    validator: (value) => input.validator(value!),
    onTap: () async {
      final selectedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now().subtract(const Duration(days: 31)),
          lastDate: finalDateController.text.isEmpty
              ? DateTime.now().add(const Duration(days: 365))
              : DateTime.parse(finalDateController.text + _dateComplement));
      if (selectedDate != null) {
        input.controller.text = selectedDate.toString().split(' ')[0];
      }
    },
  );
}

Widget createDateInputForEnd(InputModel input,
    TextEditingController initialDateController, BuildContext context) {
  return TextFormField(
    controller: input.controller,
    decoration: InputDecoration(
        labelText: input.text,
        hintText: 'yyyy-mm-dd',
        prefixIcon: Icon(input.icon)),
    validator: (value) => input.validator(value!),
    onTap: () async {
      final selectedDate = await showDatePicker(
        context: context,
        initialDate: initialDateController.text.isEmpty
            ? DateTime.now()
            : DateTime.parse(initialDateController.text + _dateComplement),
        firstDate: initialDateController.text.isEmpty
            ? DateTime.now()
            : DateTime.parse(initialDateController.text + _dateComplement),
        lastDate: DateTime.now().add(const Duration(days: 365)),
      );
      if (selectedDate != null) {
        input.controller.text = selectedDate.toString().split(' ')[0];
      }
    },
  );
}

Widget createDateInput(InputModel input, BuildContext context) {
  return TextFormField(
    controller: input.controller,
    decoration: InputDecoration(
        labelText: input.text,
        hintText: 'yyyy-mm-dd',
        prefixIcon: Icon(input.icon)),
    validator: (value) => input.validator(value!),
    onTap: () async {
      final selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now().subtract(const Duration(days: 31)),
        lastDate: DateTime.now().add(const Duration(days: 365)),
      );
      if (selectedDate != null) {
        input.controller.text = selectedDate.toString().split(' ')[0];
      }
    },
  );
}
