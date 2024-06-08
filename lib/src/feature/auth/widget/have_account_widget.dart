import 'package:chat_app/src/utils/app_colors.dart';
import 'package:chat_app/src/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class HaveAccountWidget extends StatelessWidget {
  HaveAccountWidget({
    super.key,
    required this.title,
    required this.subTitle,
    this.onPressed,
  });
  final String title;
  final String subTitle;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: AppTextStyle.appTextStyle15.copyWith(
            color: AppColors.black,
          ),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            subTitle,
            style: AppTextStyle.appTextStyle16.copyWith(
              color: AppColors.blue,
            ),
          ),
        ),
      ],
    );
  }
}
