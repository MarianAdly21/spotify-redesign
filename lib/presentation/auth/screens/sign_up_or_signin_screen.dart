import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_redesign/app_router.dart';
import 'package:spotify_redesign/common/helper/extensions/is_dark_mode_extention.dart';
import 'package:spotify_redesign/common/widget/app_bar/basic_app_bar.dart';
import 'package:spotify_redesign/common/widget/button/app_elevated_button.dart';
import 'package:spotify_redesign/core/config/app_assets.dart';
import 'package:spotify_redesign/core/config/app_color.dart';

class SignUpOrSignInScreen extends StatelessWidget {
  const SignUpOrSignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BasicAppBar(
            onPressed: () {
              context.pop();
            },
          ),
          Align(
            alignment: AlignmentDirectional.topEnd,
            child: SvgPicture.asset(AppAssets.topPattern),
          ),
          Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: SvgPicture.asset(AppAssets.buttomPattern),
          ),
          Align(
            alignment: AlignmentDirectional.bottomStart,
            child: Image.asset(AppAssets.authImage),
          ),
          _buildBody(context),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
        child: Column(
          children: [
            Spacer(),
            SvgPicture.asset(AppAssets.spotifyLogo),
            Padding(
              padding: EdgeInsets.only(top: 55.h, bottom: 21.h),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  "Enjoy listening to music",
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: context.isDarkMode
                        ? Color(0xffF2F2F2)
                        : Color(0xff383838),
                  ),
                ),
              ),
            ),
            Text(
              "Spotify is a proprietary Swedish audio streaming and media services provider ",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: context.isDarkMode
                    ? Color(0xffA0A0A0)
                    : Color(0xff797979),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 31.h),
              child: Row(
                children: [
                  Expanded(
                    child: AppElvatedButton(
                      title: "Register",
                      onPressed: () {
                        context.push(AppRouter.signupScreen);
                      },
                    ),
                  ),
                  SizedBox(width: 60.w),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        context.push(AppRouter.signinScreen);
                      },
                      child: Text(
                        "Sign in",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: context.isDarkMode
                              ? AppColor.buttonTextWhiteColor
                              : AppColor.buttonTextBlakColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
