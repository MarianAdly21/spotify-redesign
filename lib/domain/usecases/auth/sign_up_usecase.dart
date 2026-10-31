import 'package:dartz/dartz.dart';
import 'package:spotify_redesign/core/usecases/use_case.dart';
import 'package:spotify_redesign/data/models/auth/create_user_request_model.dart';
import 'package:spotify_redesign/domain/repository/auth/base_auth_repository.dart';
import 'package:spotify_redesign/service_locator.dart';

class SignupUsecase implements UseCase<Either, CreateUserRequestModel> {
  @override
  Future<Either> call({CreateUserRequestModel? params})async {
    return  sl<BaseAuthRepository>().signUp(params!);
  
  }
}
