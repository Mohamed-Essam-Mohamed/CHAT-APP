import 'package:chat_app/src/utils/app_colors.dart';
import 'package:chat_app/src/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class ForgetPasswordWidget extends StatelessWidget {
  ForgetPasswordWidget({
    super.key,
    required this.onTap,
  });
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: onTap,
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          "Forget Password?",
          style: AppTextStyle.appTextStyle15.copyWith(
            color: AppColors.blue,
          ),
        ),
      ),
    );
  }
}
