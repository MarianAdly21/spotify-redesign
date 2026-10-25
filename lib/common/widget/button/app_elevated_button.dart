import 'package:flutter/material.dart';
import 'package:spotify_redesign/core/config/app_color.dart';

class AppElvatedButton extends StatelessWidget {
  const AppElvatedButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.height,
    this.backgroundColor,
  });
  final String title;
  final VoidCallback onPressed;
  final double? height;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(height ?? 80),
        backgroundColor: backgroundColor,
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColor.buttonTextWhiteColor,
          ),
        ),
      ),
    );
  }
}
