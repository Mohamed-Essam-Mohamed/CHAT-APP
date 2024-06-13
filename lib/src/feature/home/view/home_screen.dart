import 'package:chat_app/src/feature/add_room/view/add_room_screen.dart';
import 'package:chat_app/src/provider/save_user_provider.dart';
import 'package:chat_app/src/utils/app_colors.dart';
import 'package:chat_app/src/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "HomeScreen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provideder = Provider.of<SaveUserProvider>(context);
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
              child: Form(
                // key: ,
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
                            "Chat App",
                            style: AppTextStyle.appTextStyle30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: AppColors.secondaryColor,
              onPressed: () {
                Navigator.pushNamed(context, AddRoomScreen.routeName);
              },
              child: Icon(
                Icons.add,
                size: 30.sp,
                color: AppColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
