import 'package:chat_app/src/data/firebase_app/firebase_app.dart';
import 'package:chat_app/src/feature/auth/login/view_model/login_navigator.dart';
import 'package:chat_app/src/utils/app_sharedpreferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  late LoginNavigator navigator;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  void loginFirebase() async {
    if (formKey.currentState!.validate()) {
      navigator.showLoadin();

      try {
        final credential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        // save token in shared preferences
        if (SharedPreferencesUtils.getData(key: 'TokenId') == null) {
          SharedPreferencesUtils.saveData(
              key: 'TokenId', value: credential.user!.uid);
        }
        var userObject =
            await MyFirebaseApp.getUserFirebase(credential.user!.uid);
        navigator.hideLoading();
        navigator.navigatorToHome(userObject!);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          navigator.hideLoading();
          navigator.showError('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          navigator.hideLoading();

          navigator.showError('Wrong password provided for that user.');
        }
      }
    }
  }
}
