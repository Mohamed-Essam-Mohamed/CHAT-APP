import 'package:chat_app/src/feature/auth/register/view_model/register_navigator.dart';
import 'package:chat_app/src/feature/auth/register/view_model/register_view_model.dart';
import 'package:chat_app/src/feature/auth/widget/have_account_widget.dart';
import 'package:chat_app/src/utils/app_text_style.dart';
import 'package:chat_app/src/utils/dialog_app.dart';
import 'package:chat_app/src/widget/custom_material_button.dart';
import 'package:chat_app/src/widget/custom_text_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = "register_screen";
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    implements RegisterNavigator {
  RegisterViewModel viewModel = RegisterViewModel();
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
                  child: Form(
                    key: viewModel.formKey,
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
                          controller: viewModel.nameController,
                          myValidator: (text) {
                            if (text == null || text.isEmpty) {
                              return "Enter your Name";
                            }
                            return null;
                          },
                          title: "First Name",
                          hintText: "Enter your Name",
                          keyboardType: TextInputType.name,
                        ),
                        Gap(10.h),
                        CustomTextForm(
                          controller: viewModel.emailController,
                          myValidator: (text) {
                            if (text == null || text.isEmpty) {
                              return "Enter your Email";
                            }
                            return null;
                          },
                          title: "Email address",
                          hintText: "Enter your Email",
                          keyboardType: TextInputType.emailAddress,
                        ),
                        Gap(10.h),
                        CustomTextForm(
                          controller: viewModel.passwordController,
                          myValidator: (text) {
                            if (text == null || text.isEmpty) {
                              return "Enter your Password";
                            }
                            return null;
                          },
                          title: "Password",
                          hintText: "Enter your Password",
                          isPassword: true,
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                        ),
                        Gap(33.h),
                        CustomMaterialButton(
                          onPressed: () {
                            viewModel.registerFirebase();
                          },
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
}
