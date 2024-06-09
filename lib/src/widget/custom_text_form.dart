import 'package:chat_app/src/utils/app_colors.dart';
import 'package:chat_app/src/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

typedef Validator = String? Function(String?);

class CustomTextForm extends StatefulWidget {
  final TextInputType keyboardType;
  bool obscureText;
  final String title;
  final String hintText;
  final bool isPassword;
  final TextEditingController controller;
  final Validator myValidator;

  CustomTextForm({
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.isPassword = false,
    required this.controller,
    required this.myValidator,
    required this.title,
    required this.hintText,
    Key? key,
  });

  @override
  State<CustomTextForm> createState() => _CustomTextFormState();
}

class _CustomTextFormState extends State<CustomTextForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            widget.title,
            style: AppTextStyle.appTextStyle16,
          ),
          Gap(3.h),
          TextFormField(
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.black,
            ),
            obscureText: widget.obscureText,
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: AppTextStyle.appTextStyle15,
              suffixIcon: widget.isPassword
                  ? IconButton(
                      icon: Icon(
                        widget.obscureText
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Color(0xff454A4F),
                        size: 24.sp,
                      ),
                      onPressed: () {
                        setState(() {
                          widget.obscureText = !widget.obscureText;
                        });
                      },
                    )
                  : null,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 10.sp, vertical: 9.sp),
              enabled: true,
              enabledBorder:
                  _outLineInputBorder(color: AppColors.black, width: 1),
              focusedBorder:
                  _outLineInputBorder(color: AppColors.blue, width: 1.5),
              errorBorder:
                  _outLineInputBorder(color: AppColors.red, width: 1.6),
            ),
            keyboardType: widget.keyboardType,
            controller: widget.controller,
            validator: widget.myValidator,
          ),
        ],
      ),
    );
  }

  OutlineInputBorder _outLineInputBorder(
      {required Color color, required double width}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.r),
      borderSide: BorderSide(
        width: width,
        color: color,
      ),
    );
  }
}
