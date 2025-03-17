class CpfValidation {
  static bool validateCPF(String? value) {
    if (value == null || value.isEmpty) {
      return false;
    }

    var cpf = value.replaceAll(RegExp(r'\D'), '');
    if (cpf.length != 11) {
      return false;
    }

    String p = cpf.substring(0, 1);
    if (cpf.substring(1).split('').every((s) => s == p)) {
      return false;
    }

    int sum = 0;
    for (int i = 0; i < 9; i++) {
      sum += int.parse(cpf[i]) * (10 - i);
    }
    int mod = sum % 11;
    String firstDigit = (mod < 2 ? 0 : 11 - mod).toString();

    sum = 0;
    for (int i = 0; i < 10; i++) {
      sum += int.parse(cpf[i]) * (11 - i);
    }
    mod = sum % 11;
    String secondDigit = (mod < 2 ? 0 : 11 - mod).toString();
    if (cpf.substring(9) != firstDigit + secondDigit) {
      return false;
    }
    return true;
  }
}
