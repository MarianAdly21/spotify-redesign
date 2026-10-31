import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:spotify_redesign/data/models/auth/create_user_request_model.dart';
import 'package:spotify_redesign/domain/usecases/auth/sign_up_usecase.dart';
import 'package:spotify_redesign/service_locator.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SiginUpEvent, SignUpState> {
  SignUpBloc() : super(SiginUpInitial()) {
    on<ValidateSignUpFormEvent>(_validateFormEvent);
    on<RegisterWithFormEvent>(_registerWithFormEvent);
    on<OpenLoginScreenEvent>(_openLoginScreenEvent);
  }
  FutureOr<void> _openLoginScreenEvent(
    OpenLoginScreenEvent event,
    Emitter<SignUpState> emit,
  ) {
    emit(OpenLoginScreenState());
  }

  FutureOr<void> _validateFormEvent(
    ValidateSignUpFormEvent event,
    Emitter<SignUpState> emit,
  ) {
    if (event.formKey.currentState?.validate() ?? false) {
      event.formKey.currentState!.save();
      emit(SignUpFormValidateState());
    } else {
      emit(SignUpFormNotValidateState());
    }
  }

  FutureOr<void> _registerWithFormEvent(
    RegisterWithFormEvent event,
    Emitter<SignUpState> emit,
  ) async {
    emit(SignUpLoadingState());
    Either result;
    try {
      result = await sl<SignupUsecase>().call(
        params: CreateUserRequestModel(
          fullName: event.fullName,
          email: event.email,
          password: event.password,
        ),
      );

      result.fold(
        (l) => emit(SignUpErrorState(errorMessage: l)),
        (r) => emit(SignUpSuccessfullyState()),
      );
    } on Exception catch (e) {
      emit(SignUpErrorState(errorMessage: e.toString()));
    }
  }
}
