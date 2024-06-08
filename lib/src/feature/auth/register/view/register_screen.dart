import 'package:chat_app/src/feature/auth/widget/have_account_widget.dart';
import 'package:chat_app/src/utils/app_text_style.dart';
import 'package:chat_app/src/widget/custom_material_button.dart';
import 'package:chat_app/src/widget/custom_text_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = "register_screen";
  const RegisterScreen({super.key});

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
                        "Sign Up",
                        style: AppTextStyle.appTextStyle30,
                      ),
                    ),
                    Gap(siz.height * 0.2),
                    Gap(25.h),
                    CustomTextForm(
                      controller: TextEditingController(),
                      myValidator: (text) {},
                      title: "First Name",
                      hintText: "Enter your Name",
                      keyboardType: TextInputType.name,
                    ),
                    Gap(10.h),
                    CustomTextForm(
                      controller: TextEditingController(),
                      myValidator: (text) {},
                      title: "Email address",
                      hintText: "Enter your Email",
                      keyboardType: TextInputType.emailAddress,
                    ),
                    Gap(10.h),
                    CustomTextForm(
                      controller: TextEditingController(),
                      myValidator: (text) {},
                      title: "Password",
                      hintText: "Enter your Password",
                      isPassword: true,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    Gap(33.h),
                    CustomMaterialButton(
                      onPressed: () {},
                      title: "Sign Up",
                    ),
                    Gap(20.h),
                    //? have an account
                    HaveAccountWidget(
                      title: "Already have an account?",
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      subTitle: "Sign In",
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
