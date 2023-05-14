String? validateName(String value) {
  if (value.isEmpty) {
    return 'El nombre es requerido';
  }
  return null;
}

String? validateHarvestType(String value) {
  if (value.isEmpty) {
    return 'El tipo de cosecha es requerido';
  }
  return null;
}

String? validateInitialDate(String value) {
  if (value.isEmpty) {
    return 'La fecha inicial es requerida';
  }
  return null;
}

String? validateFinalDate(String value) {
  if (value.isEmpty) {
    return 'La fecha final es requerida';
  }
  return null;
}
