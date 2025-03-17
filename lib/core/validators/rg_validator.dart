class RgValidation {
  static bool validateRG(String? value) {
    if (value == null || value.isEmpty) {
      return false;
    }

    var rg = value.replaceAll(RegExp(r'\D'), '');

    if (rg.length != 9) {
      return false;
    }

    String p = rg.substring(0, 1);
    if (rg.substring(1).split('').every((s) => s == p)) {
      return false;
    }

    return true;
  }
}
