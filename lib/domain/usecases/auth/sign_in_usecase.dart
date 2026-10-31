import 'package:dartz/dartz.dart';
import 'package:spotify_redesign/core/usecases/use_case.dart';
import 'package:spotify_redesign/data/models/auth/sign_in_user_request.dart';
import 'package:spotify_redesign/domain/repository/auth/base_auth_repository.dart';
import 'package:spotify_redesign/service_locator.dart';

class SignInUsecase implements UseCase<Either,SignInUserRequest> {
  @override
  Future<Either> call({SignInUserRequest? params})async {
   return  sl<BaseAuthRepository>().signIn(params!);
  }
}