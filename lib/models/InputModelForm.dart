import 'package:flutter/material.dart';

class InputModel {
  final String text;
  final TextEditingController controller;
  final IconData icon;
  final String? Function(String) validator;

  InputModel(
      {required this.text,
      required this.controller,
      required this.icon,
      required this.validator});
}
