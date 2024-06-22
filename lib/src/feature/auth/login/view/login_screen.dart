import 'package:chat_app/src/feature/auth/login/view_model/login_navigator.dart';
import 'package:chat_app/src/feature/auth/login/view_model/login_view_model.dart';
import 'package:chat_app/src/feature/auth/register/view/register_screen.dart';
import 'package:chat_app/src/feature/auth/widget/forget_password_widget.dart';
import 'package:chat_app/src/feature/auth/widget/have_account_widget.dart';
import 'package:chat_app/src/feature/home/view/home_screen.dart';
import 'package:chat_app/src/provider/save_user_provider.dart';
import 'package:chat_app/src/utils/app_text_style.dart';
import 'package:chat_app/src/utils/dialog_app.dart';
import 'package:chat_app/src/widget/custom_material_button.dart';
import 'package:chat_app/src/widget/custom_text_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "LoginScreen";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> implements LoginNavigator {
  final LoginViewModel viewModel = LoginViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator = this;
  }

  @override
  Widget build(BuildContext context) {
    var siz = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (_) => viewModel,
      child: Container(
        color: Colors.white,
        child: Stack(
          children: [
            SvgPicture.asset(
              "assets/svgs/backgorund.svg",
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Scaffold(
              backgroundColor: Colors.transparent,
              body: Form(
                key: viewModel.formKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Gap(50.h),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Sign In",
                            style: AppTextStyle.appTextStyle30,
                          ),
                        ),
                        Gap(siz.height * 0.2),
                        Text(
                          "Welcome Back!",
                          style: AppTextStyle.appTextStyle25,
                        ),
                        Gap(25.h),
                        CustomTextForm(
                          controller: viewModel.emailController,
                          myValidator: (text) {
                            final bool emailValid = RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(text!);
                            if (text == null || text.isEmpty) {
                              return "Enter your email";
                            }
                            if (!emailValid) {
                              return "Enter valid email";
                            }
                            return null;
                          },
                          title: "Email",
                          hintText: "Enter your email",
                        ),
                        Gap(10.h),
                        CustomTextForm(
                          controller: viewModel.passwordController,
                          myValidator: (text) {
                            if (text == null || text.isEmpty) {
                              return "Enter your password";
                            }
                            return null;
                          },
                          title: "Password",
                          hintText: "Enter your password",
                          isPassword: true,
                          obscureText: true,
                        ),
                        Gap(2.h),
                        ForgetPasswordWidget(
                          onTap: () {},
                        ),
                        Gap(50.h),
                        CustomMaterialButton(
                          onPressed: () {
                            viewModel.loginFirebase();
                          },
                          title: "Sign In",
                        ),
                        Gap(20.h),
                        //? have an account
                        HaveAccountWidget(
                          title: "Don't have an account?",
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(RegisterScreen.routeName);
                          },
                          subTitle: "Sign Up",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void hideLoading() {
    Navigator.of(context).pop();
  }

  @override
  void showError(String message) {
    DialogApp.showMessage(context: context, message: message);
  }

  @override
  void showLoadin() {
    DialogApp.showLoading(context, "Loading...");
  }

  @override
  void navigatorToHome(user) {
    var saveUserProvider =
        Provider.of<SaveUserProvider>(context, listen: false);
    saveUserProvider.user = user;
    Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
  }
}
