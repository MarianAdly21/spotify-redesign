import 'package:dartz/dartz.dart';
import 'package:spotify_redesign/data/models/auth/create_user_request_model.dart';
import 'package:spotify_redesign/data/models/auth/sign_in_user_request.dart';

abstract class BaseAuthRepository {
 Future<Either> signIn(SignInUserRequest signinUserRequest);
 Future<Either> signUp( CreateUserRequestModel createUserRequestModel);
}
