import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_redesign/app_router.dart';
import 'package:spotify_redesign/common/widget/button/app_elevated_button.dart';
import 'package:spotify_redesign/core/config/app_assets.dart';
import 'package:spotify_redesign/core/config/app_color.dart';
import 'package:spotify_redesign/presentation/choose_mode/cubit/theme_cubit.dart';

class ChooseModeScreen extends StatelessWidget {
  const ChooseModeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightBackground,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssets.chooseModeWallpapers),
                fit: BoxFit.fill,
              ),
            ),
          ),
          _buildBody(context),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 40.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset((AppAssets.spotifyLogo)),
            Spacer(),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _chooseModeWidget(context),
                AppElvatedButton(
                  onPressed: () {
                    context.push(AppRouter.signupOrSigninScreen);
                  },
                  title: "Continue",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _chooseModeWidget(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Choose mode",
          style: TextStyle(
            color: AppColor.textColor,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 32.h, bottom: 70.h),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _modeWidget(
                onTap: () {
                  context.read<ThemeCubit>().updateTheme(ThemeMode.dark);
                },
                modeText: "Dark Mode",
                icon: AppAssets.darkModeIcon,
              ),
              SizedBox(width: 60.w),
              _modeWidget(
                onTap: () {
                  context.read<ThemeCubit>().updateTheme(ThemeMode.light);
                },
                modeText: "Light Mode",
                icon: AppAssets.lightModeIcon,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _modeWidget({
    required VoidCallback onTap,
    required String icon,
    required String modeText,
  }) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: ClipOval(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: CircleAvatar(
                backgroundColor: AppColor.darkGray.withValues(alpha: 0.15),
                radius: 30,
                child: SvgPicture.asset(icon),
              ),
            ),
          ),
        ),

        // InkWell(onTap: onTap, child: SvgPicture.asset(icon)),
        SizedBox(height: 17.h),
        Text(
          modeText,
          style: TextStyle(
            color: AppColor.textColor,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
