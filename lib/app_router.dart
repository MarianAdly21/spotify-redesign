import 'package:spotify_redesign/presentation/auth/screens/signup_or_signin_screen.dart';
import 'package:spotify_redesign/presentation/choose_mode/screen/choose_mode_screen.dart';
import 'package:spotify_redesign/presentation/get_started/screen/get_started_screen.dart';
import 'package:spotify_redesign/presentation/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const splashScreen = "/";
  static const getStartedScreen = "/get-started-screen";
  static const chooseModeScreen = "/choose-mode-screen";
  static const signupOrSigninScreen = "/signup-or-signin-screen";

  static GoRouter router = GoRouter(
    routes: [
      GoRoute(path: splashScreen, builder: (context, state) => SplashScreen()),
      GoRoute(
        path: getStartedScreen,
        builder: (context, state) => GetStartedScreen(),
      ),
      GoRoute(
        path: chooseModeScreen,
        builder: (context, state) => ChooseModeScreen(),
      ),
      GoRoute(
        path: signupOrSigninScreen,
        builder: (context, state) => SignupOrSigninScreen(),
      ),
    ],
  );
}
