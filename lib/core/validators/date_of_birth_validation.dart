class DateOfBirthValidation {
  static bool validateDate(String? value) {
    if (value == null || value.isEmpty) {
      return false;
    }
    List<String> dateParts = value.split('/');
    if (dateParts.length != 3) {
      return false;
    }
    DateTime? date;
    try {
      date = DateTime.parse('${dateParts[2]}-${dateParts[1]}-${dateParts[0]}');
    } catch (e) {
      return false;
    }
    if (DateTime.now().difference(date).inDays / 365 < 18) {
      return false;
    }
    return true;
  }
}
