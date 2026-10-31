import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:spotify_redesign/data/models/auth/sign_in_user_request.dart';
import 'package:spotify_redesign/domain/usecases/auth/sign_in_usecase.dart';
import 'package:spotify_redesign/service_locator.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    on<ValidateEmailAndPasswordEvent>(_validateEmailAndPasswordEvent);
    on<LoginWithEmailAndPasswordEvent>(_loginWithEmailAndPasswordEvent);
    on<OpenSignUpScreenEvent>(_openSignUpScreenEvent);
  }
  FutureOr<void> _openSignUpScreenEvent(
    OpenSignUpScreenEvent event,
    Emitter<SignInState> emit,
  ) {
    emit(OpenSignUpScreenState());
  }

  FutureOr<void> _validateEmailAndPasswordEvent(
    ValidateEmailAndPasswordEvent event,
    Emitter<SignInState> emit,
  ) {
    if (event.formKey.currentState?.validate() ?? false) {
      event.formKey.currentState!.save();
      emit(SignInFormValidateState());
    } else {
      emit(SignInFormNotValidateState());
    }
  }

  FutureOr<void> _loginWithEmailAndPasswordEvent(
    LoginWithEmailAndPasswordEvent event,
    Emitter<SignInState> emit,
  ) async {
    emit(SignInLoadingState());
    Either result;
    try {
      result = await sl<SignInUsecase>().call(
        params: SignInUserRequest(email: event.email, password: event.password),
      );

      result.fold(
        (l) => emit(SignInErrorState(errorMessage: l)),
        (r) => emit(SignInSuccessfullyState()),
      );
    } on Exception catch (e) {
      emit(SignInErrorState(errorMessage: e.toString()));
    }
  }
}
