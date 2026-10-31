import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_redesign/common/widget/app_bar/basic_app_bar.dart';
import 'package:spotify_redesign/core/config/app_assets.dart';

class AuthBaseScaffoldWidget extends StatelessWidget {
  const AuthBaseScaffoldWidget({
    super.key,
    required this.body,
    this.verticalPadding, this.backTap,
  });
  final Widget body;
  final double? verticalPadding;
  final void Function()? backTap;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        centerTitle: true,
        title: SvgPicture.asset(AppAssets.spotifyLogo, height: 33),
        onPressed:backTap
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 28.w,
          vertical: verticalPadding ?? 57.h,
        ),
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(overscroll: false),
          child: SingleChildScrollView(child: body),
        ),
      ),
    );
    // )
  }
}
