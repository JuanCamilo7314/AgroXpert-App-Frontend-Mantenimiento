String? validateName(String value) {
  if (value.isEmpty) {
    return 'El nombre es requerido';
  }
  if (value.length < 8) {
    return 'El nombre debe tener al menos 8 caracteres';
  }
  if (value.length > 20) {
    return 'El nombre debe tener menos de 25 caracteres';
  }
  return null;
}

String? validateNumberTrees(String value) {
  if (value.isEmpty) {
    return 'El número de árboles es requerido';
  }
  if (value.isEmpty) {
    return 'El número de árboles debe tener al menos 1 caracter';
  }
  if (value.length > 10) {
    return 'El número de árboles debe tener menos de 5 caracteres';
  }
  return null;
}

String? validateTreesAge(String value) {
  if (value.isEmpty) {
    return 'La edad de los árboles es requerida';
  }
  if (value.isEmpty) {
    return 'La edad de los árboles debe tener al menos 1 caracter';
  }
  if (value.length > 5) {
    return 'La edad de los árboles debe tener menos de 5 caracteres';
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

String? validateAverageFruitWeight(String value) {
  if (value.isEmpty) {
    return 'El peso promedio de fruto es requerido';
  }
  if (value.isEmpty) {
    return 'El peso promedio de fruto debe tener al menos 1 caracter';
  }
  if (value.length > 10) {
    return 'El peso promedio de fruto debe tener menos de 5 caracteres';
  }
  return null;
}

String? validateNumberFinalProduction(String value) {
  int newValue = int.parse(value);
  if (value.isEmpty) {
    return 'El peso es requerido';
  }

  if (newValue < 0) {
    return 'El peso debe ser mayor a 0';
  }

  return null;
}