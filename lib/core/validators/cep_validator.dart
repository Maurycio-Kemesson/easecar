class CEPValidation {
  static bool validateCEP(String? value) {
    if (value == null || value.isEmpty) {
      return false;
    }

    var cep = value.replaceAll(RegExp(r'\D'), '');
    if (cep.length != 8) {
      return false;
    }

    return true;
  }
}
