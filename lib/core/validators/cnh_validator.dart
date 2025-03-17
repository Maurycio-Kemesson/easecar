class CnhValidation {
  static bool validateCNH(String? value) {
    if (value == null || value.isEmpty) {
      return false;
    }

    var cnh = value.replaceAll(RegExp(r'\D'), '');
    if (cnh.length != 11) {
      return false;
    }

    return true;
  }
}
