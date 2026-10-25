import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_redesign/app_router.dart';
import 'package:spotify_redesign/common/widget/button/app_elvated_button.dart';
import 'package:spotify_redesign/core/config/app_assets.dart';
import 'package:spotify_redesign/core/config/app_color.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppAssets.getStartedWallpapers,
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
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
                Text(
                  "Enjoy listening to music",
                  style: TextStyle(
                    color: AppColor.textColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 21.h, bottom: 37.h),
                  child: Text(
                    "Lorem ipsum dolor sit amet,consectetur adipiscing elit. Sagittis enim purus sed phasellus. Cursus ornare id scelerisque aliquam.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColor.sutTitleTextColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                AppElvatedButton(
                  onPressed: () {
                    context.go(AppRouter.chooseModeScreen);
                  },
                  title: "Get started",
                  backgroundColor: AppColor.primary,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
