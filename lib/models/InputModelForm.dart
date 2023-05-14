import 'package:flutter/material.dart';

class InputModel {
  final String text;
  final TextEditingController controller;
  final IconData? icon;
  final String? Function(String) validator;
  final List<String>? options;
  final bool? enabled;
  late final String? selectedOption;

  InputModel(
      {required this.text,
      required this.validator,
      required this.controller,
      this.icon,
      this.options = const [],
      this.enabled = true,
      this.selectedOption});
}
