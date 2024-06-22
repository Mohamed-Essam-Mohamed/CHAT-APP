import 'package:chat_app/src/data/firebase_app/firebase_app.dart';
import 'package:chat_app/src/data/model/category_type_group.dart';
import 'package:chat_app/src/data/model/group.app.dart';
import 'package:chat_app/src/data/model/user_app.dart';
import 'package:chat_app/src/feature/add_group/view_model/group_navigator.dart';
import 'package:chat_app/src/provider/save_user_provider.dart';

import 'package:flutter/material.dart';

class AddGroupViewModel extends ChangeNotifier {
  TextEditingController groupNameController = TextEditingController();
  TextEditingController groupDescriptionController = TextEditingController();
  List<CategoryTypeGroup> categoryTypeGroup =
      CategoryTypeGroup.categoryTypeGroupList();
  late CategoryTypeGroup selectedItem = categoryTypeGroup[0];
  late GroupNavigator navigator;
  var formKey = GlobalKey<FormState>();

  void addRoom({required UsersApp user}) {
    if (formKey.currentState!.validate()) {
      var group = GroupApp(
        ownerId: user.id,
        countMember: "1",
        roomId: "",
        groupName: groupNameController.text,
        groupDescription: groupDescriptionController.text,
        groupType: selectedItem.id,
      );
      navigator.showLoading();
      try {
        MyFirebaseApp.addGroup(group: group);
        navigator.hideLoading();
        navigator.navigatorToHome();
      } catch (e) {
        navigator.hideLoading();
        navigator.showError(e.toString());
      }
    }
  }
}
