class CnpjValidation {
  static bool validateCNPJ(String? value) {
    if (value == null || value.isEmpty) {
      return false;
    }

    var cnpj = value.replaceAll(RegExp(r'\D'), '');
    if (cnpj.length != 14) {
      return false;
    }

    if (cnpj.split('').every((s) => s == cnpj[0])) {
      return false;
    }

    List<int> weights = [6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2];

    int sum = 0;
    for (int i = 0; i < 12; i++) {
      sum += int.parse(cnpj[i]) * weights[i + 1];
    }
    int mod = sum % 11;
    String firstDigit = (mod < 2 ? 0 : 11 - mod).toString();

    sum = 0;
    for (int i = 0; i < 13; i++) {
      sum += int.parse(cnpj[i]) * weights[i];
    }
    mod = sum % 11;
    String secondDigit = (mod < 2 ? 0 : 11 - mod).toString();

    if (cnpj.substring(12) != firstDigit + secondDigit) {
      return false;
    }

    return true;
  }
}
