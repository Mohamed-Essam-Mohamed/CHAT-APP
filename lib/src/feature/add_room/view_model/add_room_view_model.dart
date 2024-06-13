import 'package:flutter/material.dart';

class AddRoomViewModel extends ChangeNotifier {
  TextEditingController groupNameController = TextEditingController();
  TextEditingController groupDescriptionController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  void addRoom() {
    if (formKey.currentState!.validate()) {}
  }
}
