import 'package:go_router/go_router.dart';
import 'package:spotify_redesign/presentation/get_started/screen/get_started_screen.dart';
import 'package:spotify_redesign/presentation/splash/splash_screen.dart';

class AppRouter {
  static const splashScreen = "/";
  static const getStartedScreen = "/get-started-screen";

  static GoRouter router = GoRouter(
    routes: [
      GoRoute(path: splashScreen, builder: (context, state) => SplashScreen()),
      GoRoute(
        path: getStartedScreen,
        builder: (context, state) => GetStartedScreen(),
      ),
    ],
  );
}
