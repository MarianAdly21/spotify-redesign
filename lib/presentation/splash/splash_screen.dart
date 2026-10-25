import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_redesign/app_router.dart';
import 'package:spotify_redesign/core/config/app_assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

      /// to start time to switch to another screen
       _startTime();
  }

  Future<Timer> _startTime() async {
    final duration = const Duration(milliseconds: 2000);
    return Timer(duration, () => context.go(AppRouter.getStartedScreen));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: SvgPicture.asset((AppAssets.spotifyLogo))),
    );
  }
}
