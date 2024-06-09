import 'package:chat_app/src/feature/auth/register/view_model/register_navigator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RegisterViewModel extends ChangeNotifier {
  late RegisterNavigator navigator;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  void registerFirebase() async {
    if (formKey.currentState!.validate()) {
      navigator.showLoadin();
      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        navigator.hideLoading();
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          navigator.hideLoading();
          navigator.showError('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          navigator.hideLoading();
          navigator.showError('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    }
  }
}
