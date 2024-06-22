import 'package:chat_app/src/data/firebase_app/firebase_app.dart';
import 'package:chat_app/src/data/model/group.app.dart';
import 'package:chat_app/src/data/model/message.dart';
import 'package:chat_app/src/data/model/user_app.dart';
import 'package:chat_app/src/feature/chat/view_model/chat_navigator.dart';
import 'package:flutter/material.dart';

class ChatViewModel extends ChangeNotifier {
  TextEditingController controller = TextEditingController();
  late ChatNavigator navigator;
  late GroupApp group;
  late UsersApp user;
  bool isSending = false;
  bool isEmpty = true;
  var formKey = GlobalKey<FormState>();

  void sendMessage() async {
    // if (formKey.currentState!.validate()) {
    try {
      Message message = Message(
        content: controller.text,
        dateTime: DateTime.now().millisecondsSinceEpoch,
        id: "",
        roomId: group.roomId,
        senderId: user.id,
        senderName: user.name,
      );

      notifyListeners();
      controller.text.isNotEmpty
          ? await MyFirebaseApp.insertMessage(message)
          : "";
      onChangedIsEmpty(controller.text);

      notifyListeners();
    } catch (e) {
      navigator.showMessage(e.toString());
    }
    // }
  }

  void onChangedIsEmpty(String messageContent) {
    if (messageContent.isNotEmpty) {
      isEmpty = false;
      notifyListeners();
    } else {
      isEmpty = true;
      notifyListeners();
    }
    notifyListeners();
  }
}
