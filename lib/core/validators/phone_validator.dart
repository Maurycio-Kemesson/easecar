class PhoneValidation {
  static bool validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return false;
    }
    if (value.length < 14) {
      return false;
    }
    return true;
  }
}
