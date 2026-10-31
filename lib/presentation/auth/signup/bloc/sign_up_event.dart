part of 'sign_up_bloc.dart';

@immutable
sealed class SiginUpEvent {}

class ValidateSignUpFormEvent extends SiginUpEvent {
  final GlobalKey<FormState> formKey;

  ValidateSignUpFormEvent({required this.formKey});
}
class OpenLoginScreenEvent extends SiginUpEvent{}

class RegisterWithFormEvent extends SiginUpEvent {
  final String fullName;
  final String email;
  final String password;

  RegisterWithFormEvent({
    required this.fullName,
    required this.email,
    required this.password,
  });
}
