// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:chat_app/src/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'app_colors.dart';

class DialogApp {
  static void showLoading(BuildContext context, String message) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Row(
            children: [
              const CircularProgressIndicator(color: AppColors.primaryColor),
              Gap(12.w),
              Text(
                message,
                style: AppTextStyle.appTextStyle15.copyWith(
                  color: AppColors.black,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static void showMessage(
      {required BuildContext context, required String message}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: ((context) {
        return AlertDialog(
          title: Text(
            message,
            style: AppTextStyle.appTextStyle16.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            message,
            style: AppTextStyle.appTextStyle15.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        );
      }),
    );
  }
}
