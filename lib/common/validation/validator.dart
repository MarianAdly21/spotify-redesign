import 'package:spotify_redesign/common/helper/extensions/extension_string.dart';

class Validator {
  static bool isEmail(String email) {
    const String pattern =
        r'^[a-zA-Z0-9._%-]+(\+[0-9]+)?@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    final regExp = RegExp(pattern);

    return regExp.hasMatch(email.trim());
  }

  static bool isPassword(String password) {
    const String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
    final regExp = RegExp(pattern);
    return regExp.hasMatch(password.trim());
  }

  static ValidationState validateEmail(String? email) {
    if (email.isNullOrEmpty) {
      return ValidationState.empty;
    } else if (!isEmail(email!)) {
      return ValidationState.formatting;
    } else {
      return ValidationState.valid;
    }
  }

  static ValidationState validatePassword(String? password) {
    if (password.isNullOrEmpty) {
      return ValidationState.empty;
    } else if (!isPassword(password!)) {
      return ValidationState.formatting;
    } else {
      return ValidationState.valid;
    }
  }
}

enum ValidationState { empty, formatting, valid }
