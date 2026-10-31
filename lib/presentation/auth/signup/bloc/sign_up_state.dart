part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpState {}

final class SiginUpInitial extends SignUpState {}

final class SignUpLoadingState extends SignUpState {}
final class SignUpErrorState extends SignUpState {
  final String errorMessage;

  SignUpErrorState({required this.errorMessage});
}
final class SignUpSuccessfullyState extends SignUpState {}
final class SignUpFormValidateState extends SignUpState {}
final class SignUpFormNotValidateState extends SignUpState {}
final class OpenLoginScreenState extends SignUpState {}
