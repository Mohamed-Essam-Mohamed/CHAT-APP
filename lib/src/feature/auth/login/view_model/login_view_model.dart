import 'package:chat_app/src/feature/auth/login/view_model/login_navigator.dart';
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
        navigator.hideLoading();
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
