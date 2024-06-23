import 'package:chat_app/src/data/firebase_app/firebase_app.dart';
import 'package:chat_app/src/data/model/group.app.dart';
import 'package:chat_app/src/data/model/message.dart';
import 'package:chat_app/src/feature/chat/view/widget/message_widget.dart';
import 'package:chat_app/src/feature/chat/view_model/chat_navigator.dart';
import 'package:chat_app/src/feature/chat/view_model/chat_view_model.dart';
import 'package:chat_app/src/feature/home/view/home_screen.dart';
import 'package:chat_app/src/provider/save_user_provider.dart';
import 'package:chat_app/src/utils/app_colors.dart';
import 'package:chat_app/src/utils/app_text_style.dart';
import 'package:chat_app/src/utils/dialog_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});
  static const String routeName = "ChatScreen";

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> implements ChatNavigator {
  ChatViewModel viewModel = ChatViewModel();
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator = this;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    viewModel.onChangedIsEmpty(viewModel.controller.text);
    var args = ModalRoute.of(context)!.settings.arguments as GroupApp;
    var provider = Provider.of<SaveUserProvider>(context);
    viewModel.user = provider.user!;
    viewModel.group = args;
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
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacementNamed(HomeScreen.routeName);
                          },
                          icon: const Icon(Icons.arrow_back),
                        ),
                        const Spacer(),
                        Text(
                          viewModel.group.groupName.toUpperCase(),
                          style: AppTextStyle.appTextStyle30.copyWith(
                            fontSize: 16.sp,
                            color: AppColors.white,
                          ),
                        ),
                        const Spacer(),
                        PopupMenuButton(
                          itemBuilder: (context) {
                            return [
                              PopupMenuItem(
                                value: 1,
                                height: 30.h,
                                child: const Text(
                                  "Leave group",
                                  style: TextStyle(
                                    color: AppColors.red,
                                  ),
                                ),
                                onTap: () {
                                  //? function leave group
                                },
                              ),
                            ];
                          },
                        ),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade700,
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        margin: EdgeInsets.only(
                          left: 8.w,
                          right: 8.w,
                          bottom: 5.h,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 7.h,
                        ),
                        child: Column(
                          children: [
                            _streamReadMessageWidget(context, args),
                            _sectionWirteAndSendMessageWidget(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Row _sectionWirteAndSendMessageWidget() {
    return Row(
      children: [
        _textFieldSendMessageWidget(),
        _buttonSendMessageWidget(),
      ],
    );
  }

  IconButton _buttonSendMessageWidget() {
    return IconButton(
      onPressed: viewModel.isEmpty
          ? null
          : () {
              viewModel.sendMessage();
              viewModel.controller.clear();
              _scrollDown();
              setState(() {});
            },
      icon: Container(
        padding: EdgeInsets.all(6.sp),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: viewModel.isEmpty
              ? Colors.grey.shade300
              : AppColors.secondaryColor,
        ),
        alignment: Alignment.center,
        child: Icon(
          Icons.send,
          color: viewModel.isEmpty ? AppColors.gray : AppColors.primaryColor,
        ),
      ),
    );
  }

  Expanded _textFieldSendMessageWidget() {
    return Expanded(
      child: Form(
        key: viewModel.formKey,
        child: TextFormField(
          validator: (value) {
            if (value != null || value!.isEmpty) {
              return "";
            }
            return "";
          },
          controller: viewModel.controller,
          onChanged: (value) {
            viewModel.onChangedIsEmpty(value);
            setState(() {});
          },
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(10),
            hintText: 'Type a message',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
              ),
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
                color: Colors.blue,
              ),
            ),
            errorStyle: TextStyle(
              fontSize: 0,
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Expanded _streamReadMessageWidget(BuildContext context, GroupApp args) {
    return Expanded(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.82,
        child: StreamBuilder(
          stream: MyFirebaseApp.getAllMessage(args.roomId),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text(
                snapshot.error.toString(),
                style: AppTextStyle.appTextStyle30.copyWith(
                  color: AppColors.gray.withAlpha(30),
                ),
              );
            } else {
              var listMessage =
                  snapshot.data?.docs.map((doc) => doc.data()).toList() ?? [];
              return _showListViewMessage(listMessage);
            }
          },
        ),
      ),
    );
  }

  GroupedListView _showListViewMessage(List<Message> listMessage) {
    return GroupedListView<Message, DateTime>(
      controller: scrollController,
      elements: listMessage,
      reverse: true,
      order: GroupedListOrder.DESC,
      groupBy: (element) => DateTime(
        DateTime.fromMillisecondsSinceEpoch(element.dateTime).year,
        DateTime.fromMillisecondsSinceEpoch(element.dateTime).month,
        DateTime.fromMillisecondsSinceEpoch(element.dateTime).day,
      ),
      groupHeaderBuilder: (element) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 40.h,
            child: Card(
              color: const Color(0xff2666a3),
              child: Padding(
                padding: EdgeInsets.all(10.sp),
                child: Text(
                  DateFormat.yMMMd().format(
                    DateTime.fromMillisecondsSinceEpoch(element.dateTime),
                  ),
                  style: const TextStyle(
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      groupSeparatorBuilder: (element) => Gap(1.h),
      itemBuilder: (context, Message element) => MessageWidget(
        message: element,
      ),
      itemComparator: (item1, item2) =>
          item1.dateTime.compareTo(item2.dateTime),
      useStickyGroupSeparators: true,
      floatingHeader: true,
    );
  }

  @override
  void showMessage(String message) {
    DialogApp.showMessage(context: context, message: message);
  }

  void _scrollDown() {
    scrollController.animateTo(
      scrollController.position.minScrollExtent,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
    );
  }
}
