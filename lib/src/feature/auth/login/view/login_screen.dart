import 'package:chat_app/src/feature/auth/register/view/register_screen.dart';
import 'package:chat_app/src/feature/auth/widget/forget_password_widget.dart';
import 'package:chat_app/src/feature/auth/widget/have_account_widget.dart';
import 'package:chat_app/src/utils/app_colors.dart';
import 'package:chat_app/src/utils/app_text_style.dart';
import 'package:chat_app/src/widget/custom_material_button.dart';
import 'package:chat_app/src/widget/custom_text_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "LoginScreen";
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var siz = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          SvgPicture.asset(
            "assets/svgs/background.svg",
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Padding(
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
                      controller: TextEditingController(),
                      myValidator: (text) {},
                      title: "Email",
                      hintText: "Enter your email",
                    ),
                    Gap(10.h),
                    CustomTextForm(
                      controller: TextEditingController(),
                      myValidator: (text) {},
                      title: "Password",
                      hintText: "Enter your password",
                    ),
                    Gap(2.h),
                    ForgetPasswordWidget(
                      onTap: () {},
                    ),
                    Gap(50.h),
                    CustomMaterialButton(
                      onPressed: () {},
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
        ],
      ),
    );
  }
}
