import 'package:chat_app/src/data/model/group.app.dart';
import 'package:chat_app/src/feature/chat/view/chat_screen.dart';
import 'package:chat_app/src/utils/app_colors.dart';
import 'package:chat_app/src/utils/app_text_style.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class JoinScreen extends StatelessWidget {
  static const String routeName = 'JoinScreen';
  const JoinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as GroupApp;
    return Container(
      color: AppColors.white,
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
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          args.groupName,
                          style: AppTextStyle.appTextStyle30,
                        ),
                      ),
                      SingleChildScrollView(
                        child: Container(
                          padding: EdgeInsets.only(
                            top: 20.h,
                            left: 20.w,
                            right: 20.w,
                            bottom: 60.h,
                          ),
                          width: double.infinity,
                          // height: 500,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.25),
                                spreadRadius: 2,
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                              const BoxShadow(
                                color: AppColors.secondaryColor,
                                spreadRadius: 1,
                                blurRadius: 10,
                                offset: Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Gap(40.h),
                              Text(
                                "Hello, Welcome to our chat room.",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: const Color(0xff303030),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "Join ${args.groupName}",
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  color: const Color(0xff303030),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Gap(30.h),
                              Image.asset(
                                "assets/images/${args.groupType}.png",
                                height: 200.h,
                              ),
                              Gap(30.h),
                              Text(
                                args.groupDescription,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: const Color(0xff7F7F7F),
                                  fontSize: 14.sp,
                                ),
                              ),
                              Gap(15.h),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 50.w),
                                child: SizedBox(
                                  height: 40.h,
                                  width: 100.w,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                      ),
                                      backgroundColor: AppColors.secondaryColor,
                                      foregroundColor: Colors.white,
                                    ),
                                    onPressed: () async {
                                      Navigator.of(context).pushNamed(
                                        ChatScreen.routeName,
                                        arguments: args,
                                      );
                                    },
                                    child: const Text(
                                      "Join",
                                      style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w900,
                                        height: 2,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
