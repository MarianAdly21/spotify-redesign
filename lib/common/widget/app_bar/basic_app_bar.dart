import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_redesign/common/helper/extensions/is_dark_mode_extention.dart';
import 'package:spotify_redesign/core/config/app_assets.dart';
import 'package:spotify_redesign/core/config/app_color.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BasicAppBar({super.key, this.title, this.centerTitle, this.onPressed});
  final Widget? title;
  final bool? centerTitle;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      surfaceTintColor: AppColor.transparent,
      centerTitle: centerTitle,
      leading: IconButton(
        onPressed: onPressed,
        icon: CircleAvatar(
          backgroundColor: context.isDarkMode
              ? AppColor.whiteColor.withValues(alpha: 0.15)
              : AppColor.backIconBg.withValues(alpha: 0.1),
          //  maxRadius: ,
          child: SvgPicture.asset(
            AppAssets.backIcon,
            colorFilter: ColorFilter.mode(
              context.isDarkMode ? AppColor.whiteColor : AppColor.blackColor,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
      title: title,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
