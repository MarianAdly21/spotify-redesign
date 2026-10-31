import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:spotify_redesign/core/config/app_color.dart';

class AppTextFormField extends StatefulWidget {
  AppTextFormField({
    super.key,
    required this.hintText,
    this.obscure = false,
    this.controller,
    this.validator,
    this.onSaved,
  });
  final String hintText;
  bool obscure = false;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {

  bool isObscure = true;
  bool setObscure = false;
  @override
  Widget build(BuildContext context) {

    if (!setObscure) {
      isObscure=widget.obscure;
      setObscure = true;
    }

    return Padding(
      padding: EdgeInsetsDirectional.only(bottom: 16.h),
      child: TextFormField(
        obscureText: isObscure,
        controller: widget.controller,
        validator: widget.validator,
        cursorColor: AppColor.blackColor,
        onSaved: widget.onSaved,
        decoration: InputDecoration(
          suffixIcon: widget.obscure 
              ? IconButton(
                  icon: Icon(
                    isObscure
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: AppColor.suffixIcon,
                  ),
                  onPressed: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                )
              : null,
          contentPadding: EdgeInsets.symmetric(
            vertical: 28.h,
            horizontal: 20.w,
          ),
          hintText: widget.hintText,
        ),
        //.applyDefaults(Theme.of(context).inputDecorationTheme),
      ),
    );
  }

  // OutlineInputBorder _outLineInputBorder({required Color color}) {
  //   return OutlineInputBorder(
  //     borderRadius: BorderRadius.circular(30),
  //     borderSide: BorderSide(color: color),
  //   );
  // }
}
