import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_redesign/data/models/auth/create_user_request_model.dart';
import 'package:spotify_redesign/data/models/auth/sign_in_user_request.dart';

abstract class BaseAuthFirebaseService {
  Future<Either> signIn(SignInUserRequest signinUserRequest);
  Future<Either> signUp(CreateUserRequestModel createUserRequestModel);
}

class AuthFirebaseService extends BaseAuthFirebaseService {
  @override
  Future<Either> signIn(SignInUserRequest signinUserRequest) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: signinUserRequest.email,
        password: signinUserRequest.password,
      );
      return const Right('Signin was Successful');
    } on FirebaseAuthException catch (e) {
      String message = '';

      if (e.code == 'invalid-email' ||
          e.code == 'invalid-credential' ||
          e.code == 'user-not-found' ||
          e.code == 'wrong-password') {
        message = 'Invalid email or password';
      }

      return Left(message);
    } on Exception catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either> signUp(CreateUserRequestModel createUserRequestModel) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: createUserRequestModel.email,
        password: createUserRequestModel.password,
      );

      return right("Signin was Successful");
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'invalid-email') {
        message = 'Invalid email address.';
      } else if (e.code == 'email-already-in-use') {
        message = 'This email is already registered. Please log in instead.';
      } else if (e.code == 'weak-password') {
        message = 'The password is too weak.';
      } else {
        message = 'Something went wrong. Please try again.';
      }
      return Left(message);
    } on Exception catch (e) {
      return left(e.toString());
    }
  }
}
