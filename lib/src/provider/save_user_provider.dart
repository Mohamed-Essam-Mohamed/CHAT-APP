import 'package:chat_app/src/data/firebase_app/firebase_app.dart';
import 'package:chat_app/src/data/model/user_app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class SaveUserProvider extends ChangeNotifier {
  User? firebaseUser;
  UsersApp? user;
  SaveUserProvider() {
    firebaseUser = FirebaseAuth.instance.currentUser;
    initUser();
  }
  initUser() async {
    if (firebaseUser != null) {
      user = await MyFirebaseApp.getUserFirebase(firebaseUser!.uid);
    }
  }
}
