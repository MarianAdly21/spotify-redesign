import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_redesign/app_router.dart';
import 'package:spotify_redesign/common/helper/extensions/is_dark_mode_extention.dart';
import 'package:spotify_redesign/common/validation/app_validate.dart';
import 'package:spotify_redesign/common/widget/app_text_form_field.dart';
import 'package:spotify_redesign/common/widget/button/app_elevated_button.dart';
import 'package:spotify_redesign/core/config/app_assets.dart';
import 'package:spotify_redesign/core/config/app_color.dart';
import 'package:spotify_redesign/presentation/auth/signup/bloc/sign_up_bloc.dart';
import 'package:spotify_redesign/presentation/auth/widget/auth_base_scaffold_widget.dart';
import 'package:spotify_redesign/presentation/auth/widget/auth_divider_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpBloc(),
      child: SignUpScreenWithBlco(),
    );
  }
}

class SignUpScreenWithBlco extends StatefulWidget {
  const SignUpScreenWithBlco({super.key});

  @override
  State<SignUpScreenWithBlco> createState() => _SignUpScreenWithBlcoState();
}

class _SignUpScreenWithBlcoState extends State<SignUpScreenWithBlco>
    with AppValidate {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  AutovalidateMode? autovalidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late String _password;
  late String _email;
  late String _fullName;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return AuthBaseScaffoldWidget(
      verticalPadding: 40.h,
      backTap: () {
        context.pop();
      },
      body: BlocConsumer<SignUpBloc, SignUpState>(
        listener: (context, state) {
          if (state is SignUpLoadingState) {
            isLoading = true;
          } else {
            isLoading = false;
          }

          if (state is SignUpFormValidateState) {
            _registerWithFormEvent();
          } else if (state is SignUpFormNotValidateState) {
            autovalidateMode = AutovalidateMode.onUserInteraction;
          } else if (state is SignUpErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: const Duration(seconds: 2),
                content: Text(state.errorMessage),
              ),
            );
          } else if (state is OpenLoginScreenState) {
            _navToLoginScreen(context);
          } else if (state is SignUpSuccessfullyState) {
            /// Nav to home screen
          }
        },
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _signupHeader(context),
              _formWidget(),
              AuthDividerWidget(),
              _socialButtonWidget(context),
              _dontHaveAnAccountWidget(context),
            ],
          );
        },
      ),
    );
  }

  ///////////////////////////////////////////////////////////
  //////////////////// Widget methods ///////////////////////
  ///////////////////////////////////////////////////////////

  Widget _formWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 26.h),
      child: Form(
        key: loginFormKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            AppTextFormField(
              hintText: "Full Name",
              controller: _fullNameController,
              validator: _fullNameValidator,
              onSaved: _onSavedFullName,
            ),
            AppTextFormField(
              hintText: "Enter Email",
              controller: _emailController,
              validator: (value) => emailValidator(value),
              onSaved: _onSavedEmail,
            ),
            AppTextFormField(
              hintText: "Password",
              obscure: true,
              controller: _passwordController,
              validator: (value) => passwordValidator(value),
              onSaved: _onSavedPassword,
            ),
            SizedBox(height: 16.h),

            AppElvatedButton(
              title: isLoading ? "Loading.." : "Create Account",
              onPressed: () {
                _currentBloc.add(
                  ValidateSignUpFormEvent(formKey: loginFormKey),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _dontHaveAnAccountWidget(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Do you have an account?",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: context.isDarkMode
                ? AppColor.colorTextDarkMode
                : AppColor.colorTextLightMode,
          ),
        ),
        TextButton(
          onPressed: () {
            _currentBloc.add(OpenLoginScreenEvent());
          },
          child: Text(
            "sign In",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xff288CE9),
            ),
          ),
        ),
      ],
    );
  }

  Widget _socialButtonWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 38.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(AppAssets.googleIcon),
          SizedBox(width: 60.w),
          SvgPicture.asset(
            AppAssets.appleIcon,
            colorFilter: context.isDarkMode
                ? ColorFilter.mode(AppColor.whiteColor, BlendMode.srcIn)
                : null,
          ),
        ],
      ),
    );
  }

  Widget _signupHeader(BuildContext context) {
    return Column(
      children: [
        Text(
          "Register",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: context.isDarkMode
                ? AppColor.buttonTextWhiteColor
                : AppColor.buttonTextBlakColor,
          ),
        ),
        SizedBox(height: 15.h),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: "If you need any support ",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: context.isDarkMode
                  ? AppColor.colorTextDarkMode
                  : AppColor.colorTextLightMode,
            ),
            children: [
              TextSpan(
                text: "click here",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColor.primary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  ///////////////////////////////////////////////////////////
  //////////////////// Helper methods ///////////////////////
  ///////////////////////////////////////////////////////////

  SignUpBloc get _currentBloc => context.read<SignUpBloc>();

  void _registerWithFormEvent() {
    _currentBloc.add(
      RegisterWithFormEvent(
        fullName: _fullName,
        email: _email,
        password: _password,
      ),
    );
  }

  void _navToLoginScreen(BuildContext context) {
    context.push(AppRouter.signinScreen);
  }

  void _onSavedEmail(String? value) {
    _email = value!;
  }

  void _onSavedFullName(String? value) {
    _fullName = value!;
  }

  void _onSavedPassword(String? value) {
    _password = value!;
  }

  String? _fullNameValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Required";
    }

    return null;
  }
}
