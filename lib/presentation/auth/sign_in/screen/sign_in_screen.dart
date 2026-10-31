import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_redesign/app_router.dart';
import 'package:spotify_redesign/common/helper/extensions/is_dark_mode_extention.dart';
import 'package:spotify_redesign/common/validation/app_validate.dart';
import 'package:spotify_redesign/common/widget/app_text_form_field.dart';
import 'package:spotify_redesign/common/widget/button/app_elevated_button.dart';
import 'package:spotify_redesign/core/config/app_assets.dart';
import 'package:spotify_redesign/core/config/app_color.dart';
import 'package:spotify_redesign/presentation/auth/sign_in/bloc/sign_in_bloc.dart';
import 'package:spotify_redesign/presentation/auth/widget/auth_divider_widget.dart';
import 'package:spotify_redesign/presentation/auth/widget/auth_base_scaffold_widget.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInBloc(),
      child: SignInScreenWithBloc(),
    );
  }
}

class SignInScreenWithBloc extends StatefulWidget {
  const SignInScreenWithBloc({super.key});

  @override
  State<SignInScreenWithBloc> createState() => _SignInScreenWithBlocState();
}

class _SignInScreenWithBlocState extends State<SignInScreenWithBloc>
    with AppValidate {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  AutovalidateMode? autovalidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late String _password;
  late String _emailOrUserName;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return AuthBaseScaffoldWidget(
      backTap: () {
        context.pop();
      },
      body: BlocConsumer<SignInBloc, SignInState>(
        listener: (context, state) {
          if (state is SignInLoadingState) {
            isLoading = true;
          } else {
            isLoading = false;
          }
          if (state is SignInFormValidateState) {
            _loginWithEmailAndPasswordEvent();
          } else if (state is SignInFormNotValidateState) {
            autovalidateMode = AutovalidateMode.onUserInteraction;
          } else if (state is SignInErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: const Duration(seconds: 2),
                behavior: SnackBarBehavior.floating,
                content: Text(state.errorMessage),
              ),
            );
          } else if (state is OpenSignUpScreenState) {
            context.pushReplacement(AppRouter.signupScreen);
          } else if (state is SignInSuccessfullyState) {
            /// Nav to home screen
          }
        },
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _signinHeader(context),
              _formWidget(context),
              AuthDividerWidget(),
              _socialButtonWidget(context),
              _notAMemberWidget(context),
            ],
          );
        },
      ),
    );
  }

  void _loginWithEmailAndPasswordEvent() {
    _currentBloc.add(
      LoginWithEmailAndPasswordEvent(
        email: _emailOrUserName,
        password: _password,
      ),
    );
  }

  ///////////////////////////////////////////////////////////
  //////////////////// Widget methods ///////////////////////
  ///////////////////////////////////////////////////////////
  Widget _signinHeader(BuildContext context) {
    return Column(
      children: [
        Text(
          "Sign In",
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

  Widget _notAMemberWidget(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "not a member?",
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
            _currentBloc.add(OpenSignUpScreenEvent());
          },
          child: Text(
            "register now",
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

  Widget _formWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 26.h),
      child: Form(
        key: loginFormKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppTextFormField(
              hintText: "enter username or email",
              controller: _emailController,
              validator: (value) => emailValidator(value),
              onSaved: _onSavedEmailOrUserName,
            ),
            AppTextFormField(
              hintText: "Password",
              obscure: true,
              controller: _passwordController,
              validator: (value) => loginPasswordValidator(value),
              onSaved: _onSavedPassword,
            ),
            Text(
              "Recovery password",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: context.isDarkMode
                    ? Color(0xffAEAEAE)
                    : Color(0xff383838),
              ),
            ),
            SizedBox(height: 10.h),
            AppElvatedButton(
              title: "Sign In",
              onPressed: () {
                _currentBloc.add(
                  ValidateEmailAndPasswordEvent(formKey: loginFormKey),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  ///////////////////////////////////////////////////////////
  //////////////////// Helper methods ///////////////////////
  ///////////////////////////////////////////////////////////

  SignInBloc get _currentBloc => context.read<SignInBloc>();

  void _onSavedEmailOrUserName(String? value) {
    _emailOrUserName = value!;
  }

  void _onSavedPassword(String? value) {
    _password = value!;
  }
}
