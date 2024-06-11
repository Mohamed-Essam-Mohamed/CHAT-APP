import 'package:chat_app/src/data/model/user_app.dart';

abstract class LoginNavigator {
  void showLoadin();
  void hideLoading();
  void showError(String message);
  void navigatorToHome(UsersApp user);
}
