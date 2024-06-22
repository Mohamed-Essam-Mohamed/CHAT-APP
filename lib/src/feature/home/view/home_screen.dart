import 'package:chat_app/src/data/firebase_app/firebase_app.dart';
import 'package:chat_app/src/data/model/group.app.dart';
import 'package:chat_app/src/feature/add_group/view/add_group_screen.dart';
import 'package:chat_app/src/feature/chat/view/chat_screen.dart';
import 'package:chat_app/src/provider/save_user_provider.dart';
import 'package:chat_app/src/utils/app_colors.dart';
import 'package:chat_app/src/utils/app_text_style.dart';
import 'package:chat_app/src/utils/dialog_app.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "HomeScreen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var changeTabBar = 0;
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
                      Gap(15.h),
                      DefaultTabController(
                        length: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TabBar(
                              onTap: (value) {
                                changeTabBar = value;
                                setState(() {});
                              },
                              isScrollable: true,
                              labelColor: const Color(0xFF00BAAB),
                              unselectedLabelColor: Colors.transparent,
                              labelStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                              unselectedLabelStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                              dividerColor: Colors.transparent,
                              physics: const BouncingScrollPhysics(),
                              indicatorPadding:
                                  const EdgeInsets.only(right: 10),
                              indicatorColor: const Color(0xFF00BAAB),
                              tabs: [
                                Text(
                                  "My Groups",
                                  style: AppTextStyle.appTextStyle20
                                      .copyWith(color: AppColors.white),
                                ),
                                Text(
                                  "Browse",
                                  style: AppTextStyle.appTextStyle20
                                      .copyWith(color: AppColors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Gap(30.h),
                      StreamBuilder<QuerySnapshot<GroupApp>>(
                        stream: changeTabBar == 0
                            ? MyFirebaseApp.getSpecificGroup(
                                provideder.user?.id ?? "")
                            : MyFirebaseApp.getAllGroup(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(
                                color: AppColors.secondaryColor,
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return Text(
                              snapshot.error.toString(),
                              style: AppTextStyle.appTextStyle30.copyWith(
                                color: AppColors.gray.withAlpha(30),
                              ),
                            );
                          } else {
                            var listGroup = snapshot.data?.docs
                                .map((data) => data.data())
                                .toList();
                            return SizedBox(
                              height: MediaQuery.of(context).size.height * 0.85,
                              width: double.infinity,
                              child: GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10.0.w,
                                  mainAxisSpacing: 10.0.h,
                                  childAspectRatio: 0.8,
                                ),
                                itemBuilder: (context, index) => InkWell(
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                        ChatScreen.routeName,
                                        arguments: listGroup?[index]);
                                  },
                                  child: _boxGroupItem(listGroup, index),
                                ),
                                itemCount: listGroup?.length,
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: AppColors.secondaryColor,
              onPressed: () {
                Navigator.pushNamed(context, AddGroupScreen.routeName);
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

  Container _boxGroupItem(List<GroupApp>? listGroup, int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.sp),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 10.h,
          horizontal: 8.w,
        ),
        child: Column(
          children: [
            Image.asset(
              "assets/images/${listGroup?[index].groupType}.png",
              width: 85.w,
              height: 85.h,
            ),
            Gap(10.h),
            Text(
              listGroup?[index].groupName ?? "",
              style: AppTextStyle.appTextStyle20,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
