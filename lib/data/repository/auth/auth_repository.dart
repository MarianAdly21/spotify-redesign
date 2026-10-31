import 'package:dartz/dartz.dart';
import 'package:spotify_redesign/data/models/auth/create_user_request_model.dart';
import 'package:spotify_redesign/data/models/auth/sign_in_user_request.dart';
import 'package:spotify_redesign/data/sources/auth_firebase_service.dart';
import 'package:spotify_redesign/domain/repository/auth/base_auth_repository.dart';
import 'package:spotify_redesign/service_locator.dart';

class AuthRepository  extends BaseAuthRepository{

  @override
  Future<Either> signIn(SignInUserRequest signinUserRequest)async {
     return await  sl<AuthFirebaseService>().signIn(signinUserRequest);

  }

  @override
  Future<Either> signUp(CreateUserRequestModel createUserRequestModel)async {

  return await  sl<AuthFirebaseService>().signUp(createUserRequestModel);

  }
} 