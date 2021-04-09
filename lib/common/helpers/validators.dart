class FieldValidator {
  static String validate({String value}) {
    if (value != null) {
      if (value.isEmpty) {
        return 'Field cannot be empty!';
      }
    } else {
      return null;
    }

    return null;
  }
}
