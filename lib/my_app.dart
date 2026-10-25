import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:spotify_redesign/app_router.dart';
import 'package:spotify_redesign/core/config/theme/app_theme.dart';
import 'package:spotify_redesign/presentation/choose_mode/cubit/theme_cubit.dart';

class SpotifyApp extends StatelessWidget {
  const SpotifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilPlusInit(
      designSize: const Size(390, 844),
      child: MultiBlocProvider(
        providers: [BlocProvider(create: (_) => ThemeCubit())],
        child: BlocBuilder<ThemeCubit, ThemeMode>(
          builder: (context, mode) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: mode,
              routerConfig: AppRouter.router,
            );
          },
        ),
      ),
    );
  }
}
