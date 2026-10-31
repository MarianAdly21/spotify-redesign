part of 'sign_in_bloc.dart';

@immutable
sealed class SignInEvent {}
class ValidateEmailAndPasswordEvent extends SignInEvent {
  final GlobalKey<FormState> formKey;

  ValidateEmailAndPasswordEvent({required this.formKey});
}
class OpenSignUpScreenEvent extends SignInEvent{}

class LoginWithEmailAndPasswordEvent extends SignInEvent {
  final String email;
  final String password;

  LoginWithEmailAndPasswordEvent({
    required this.email,
    required this.password,
  });
}
