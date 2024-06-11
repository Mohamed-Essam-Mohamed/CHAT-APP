import 'package:chat_app/src/feature/auth/login/view/login_screen.dart';
import 'package:chat_app/src/feature/home/view/home_screen.dart';
import 'package:chat_app/src/utils/app_sharedpreferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = 'SplashScreen';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String routeName = LoginScreen.routeName;
  @override
  void initState() {
    super.initState();
    var checkToken = SharedPreferencesUtils.getData(key: 'TokenId');
    if (checkToken != null) {
      routeName = HomeScreen.routeName;
    }
    Future.delayed(
      const Duration(seconds: 4),
      () {
        Navigator.of(context).pushReplacementNamed(routeName);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(
              "assets/lottie/animated-splash.json",
              width: 300.w,
              height: 300.h,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}
