import 'package:get_it/get_it.dart';
import 'package:spotify_redesign/data/repository/auth/auth_repository.dart';
import 'package:spotify_redesign/data/sources/auth_firebase_service.dart';
import 'package:spotify_redesign/domain/repository/auth/base_auth_repository.dart';
import 'package:spotify_redesign/domain/usecases/auth/sign_in_usecase.dart';
import 'package:spotify_redesign/domain/usecases/auth/sign_up_usecase.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies()async {
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseService());
  sl.registerSingleton<BaseAuthRepository>(AuthRepository());
  sl.registerSingleton<SignupUsecase>(SignupUsecase());
  sl.registerSingleton<SignInUsecase>(SignInUsecase());
}
