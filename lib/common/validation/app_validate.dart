import 'package:spotify_redesign/common/validation/validator.dart';

mixin AppValidate {
  String? emailValidator(String? email) {
    final ValidationState validationState = Validator.validateEmail(email);
    switch (validationState) {
      case ValidationState.empty:
        return "Required";
      case ValidationState.formatting:
        return "Please enter a valid email address";
      case ValidationState.valid:
        return null;
    }
  }

  String? passwordValidator(String? password) {
    final ValidationState validationState = Validator.validatePassword(
      password,
    );
    switch (validationState) {
      case ValidationState.empty:
        return "Required";
      case ValidationState.formatting:
        return "Please enter a valid password";
      case ValidationState.valid:
        return null;
    }
  }

  String? loginPasswordValidator(String? value) {
    final ValidationState validationState = Validator.validatePassword(value);
    switch (validationState) {
      case ValidationState.empty:
        return "Required";
      default:
        return null;
    }
  }
}
