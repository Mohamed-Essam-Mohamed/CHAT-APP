import 'package:chat_app/src/data/model/category_type_group.dart';
import 'package:chat_app/src/feature/add_room/view_model/add_room_view_model.dart';
import 'package:chat_app/src/utils/app_colors.dart';
import 'package:chat_app/src/utils/app_text_style.dart';
import 'package:chat_app/src/widget/custom_material_button.dart';
import 'package:chat_app/src/widget/custom_text_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class AddRoomScreen extends StatefulWidget {
  static const String routeName = "AddRoomScreen";
  AddRoomScreen({super.key});

  @override
  State<AddRoomScreen> createState() => _AddRoomScreenState();
}

class _AddRoomScreenState extends State<AddRoomScreen> {
  var categoryTypeGroup = CategoryTypeGroup.categoryTypeGroupList();
  late CategoryTypeGroup selectedItem;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedItem = categoryTypeGroup[0];
  }

  AddRoomViewModel viewModel = AddRoomViewModel();

  @override
  Widget build(BuildContext context) {
    var _siz = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Container(
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
                  key: viewModel.formKey,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 13.w),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Add Room",
                              style: AppTextStyle.appTextStyle30,
                            ),
                          ),
                          Gap(_siz.height * 0.1),
                          Container(
                            padding: EdgeInsets.all(10.h),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(10.r),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.black.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: const Offset(0, 1),
                                ),
                                BoxShadow(
                                  color: AppColors.black.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: const Offset(0, 1),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Gap(15.h),
                                Text(
                                  "Create New Group",
                                  style: AppTextStyle.appTextStyle20,
                                ),
                                Gap(15.h),
                                SvgPicture.asset(
                                  "assets/svgs/image-groups.svg",
                                  color: AppColors.secondaryColor,
                                  height: 100.h,
                                  width: 100.w,
                                  fit: BoxFit.contain,
                                ),
                                Gap(15.h),
                                CustomTextForm(
                                  controller: viewModel.groupNameController,
                                  myValidator: (text) {
                                    if (text == null || text.isEmpty) {
                                      return "Enter Group Name";
                                    }
                                    return null;
                                  },
                                  title: "Group Name",
                                  hintText: "Enter Group Name",
                                  obscureText: false,
                                  isPassword: false,
                                ),
                                Gap(15.h),
                                _selectedTypeGroupWidget(),
                                CustomTextForm(
                                  controller:
                                      viewModel.groupDescriptionController,
                                  myValidator: (text) {
                                    if (text == null || text.isEmpty) {
                                      return "Enter Group Descreption";
                                    }
                                    return null;
                                  },
                                  title: "Group Descreption",
                                  hintText: "Enter Group Descreption",
                                  maxLine: 3,
                                  minLine: 1,
                                ),
                                Gap(15.h),
                                CustomMaterialButton(
                                  onPressed: () {
                                    viewModel.addRoom();
                                  },
                                  title: "Create Group",
                                )
                              ],
                            ),
                          )
                        ],
                      ),
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

  Container _selectedTypeGroupWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.h),
      margin: EdgeInsets.symmetric(horizontal: 7.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: AppColors.black,
        ),
      ),
      child: DropdownButton<CategoryTypeGroup>(
        borderRadius: BorderRadius.circular(10.r),
        elevation: 50,
        isExpanded: true,
        iconSize: 30.h,
        underline: Container(),
        value: selectedItem,
        items: categoryTypeGroup.map((catergoryTypeGroup) {
          return DropdownMenuItem<CategoryTypeGroup>(
            value: catergoryTypeGroup,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  catergoryTypeGroup.name,
                  style: AppTextStyle.appTextStyle20,
                ),
                Image.asset(
                  catergoryTypeGroup.image,
                  height: 40.h,
                  width: 40.w,
                  fit: BoxFit.contain,
                  color: AppColors.secondaryColor,
                ),
              ],
            ),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            selectedItem = value!;
          });
        },
      ),
    );
  }
}
