String? validateFinalDate(String value) {
  if (value.isEmpty) {
    return 'La fecha final es requerida';
  }
  return null;
}

String? validateTotalProduction(String value) {
  if (value.isEmpty) {
    return 'El peso total en kilogramos es requerido';
  }

  try {
    double newValue = double.parse(value);
    if (newValue < 0) {
      return 'El peso total en kilogramos debe ser mayor a 0';
    }
  } catch (e) {
    return 'El peso total en kilogramos debe ser un número';
  }

  return null;
}

String? validateExportMarket(String value) {
  if (value.isEmpty) {
    return 'El peso total en kilogramos es requerido';
  }

  try {
    double newValue = double.parse(value);
    if (newValue < 0) {
      return 'El peso total en kilogramos debe ser mayor a 0';
    }
  } catch (e) {
    return 'El peso total en kilogramos debe ser un número';
  }

  return null;
}

String? validateNationalMarket(String value) {
  if (value.isEmpty) {
    return 'El peso total en kilogramos es requerido';
  }

  try {
    double newValue = double.parse(value);
    if (newValue < 0) {
      return 'El peso total en kilogramos debe ser mayor a 0';
    }
  } catch (e) {
    return 'El peso total en kilogramos debe ser un número';
  }

  return null;
}

String? validateWaste(String value) {
  if (value.isEmpty) {
    return 'El peso total en kilogramos es requerido';
  }

  try {
    double newValue = double.parse(value);
    if (newValue < 0) {
      return 'El peso total en kilogramos debe ser mayor a 0';
    }
  } catch (e) {
    return 'El peso total en kilogramos debe ser un número';
  }

  return null;
}

String? validateCategory(String value) {
  if (value.isEmpty) {
    return 'La categoría es requerida';
  }
  return null;
}

String? validateQuantity(String value) {
  if (value.isEmpty) {
    return 'El peso es requerido';
  }
  int? newValue = int.parse(value);

  if (newValue < 0) {
    return 'El peso debe ser mayor a 0';
  }

  return null;
}
