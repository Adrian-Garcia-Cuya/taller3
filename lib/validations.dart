// regex para validar email
String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Por favor, ingrese algún texto.';
  }
  if (!RegExp(
          r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$')
      .hasMatch(value)) {
    return 'Por favor, ingrese un email válido.';
  }
  return null;
}

String? validateText(String? value) {
  if (value == null || value.isEmpty) {
    return 'Por favor, ingrese algún texto.';
  }
  return null;
}

// regex para validar numero entero mayor a 18
String? validateAge(String? value) {
  if (value == null || value.isEmpty) {
    return 'Por favor, ingrese algún texto.';
  }
  if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
    return 'Por favor, ingrese un número válido.';
  }
  if (int.parse(value) < 18) {
    return 'Por favor, ingrese un número mayor a 18.';
  }
  return null;
}

// regex para validar solo numeros decimales
String? validateNumber(String? value) {
  if (value == null || value.isEmpty) {
    return 'Por favor, ingrese algún texto.';
  }
  if (!RegExp(r'^[0-9]+(\.[0-9]+)?$').hasMatch(value)) {
    return 'Por favor, ingrese un número válido.';
  }
  return null;
}
