import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:spotify_redesign/common/helper/extensions/is_dark_mode_extention.dart';
import 'package:spotify_redesign/core/config/app_color.dart';

class AuthDividerWidget extends StatelessWidget {
  const AuthDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _gradientDivide(
          colors: [AppColor.deviderColor1, AppColor.deviderColor],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "Or",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: context.isDarkMode
                  ? AppColor.colorTextDarkMode
                  : AppColor.colorTextLightMode,
            ),
          ),
        ),
        _gradientDivide(
          colors: [AppColor.deviderColor, AppColor.deviderColor1],
        ),
      ],
    );
  }

  Widget _gradientDivide({required List<Color> colors}) {
    return Expanded(
      child: Container(
        height: (0.4).h,
        decoration: BoxDecoration(gradient: LinearGradient(colors: colors)),
      ),
    );
  }
}
