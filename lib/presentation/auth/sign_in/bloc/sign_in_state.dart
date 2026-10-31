part of 'sign_in_bloc.dart';

@immutable
sealed class SignInState {}

final class SignInInitial extends SignInState {}
final class SignInLoadingState extends SignInState {}
final class SignInErrorState extends SignInState {
  final String errorMessage;

  SignInErrorState({required this.errorMessage});
}
final class SignInSuccessfullyState extends SignInState {}
final class SignInFormValidateState extends SignInState {}
final class SignInFormNotValidateState extends SignInState {}
final class OpenSignUpScreenState extends SignInState {}
