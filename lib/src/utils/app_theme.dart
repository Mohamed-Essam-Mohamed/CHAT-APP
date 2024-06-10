import 'package:chat_app/src/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData myTheme = ThemeData(
    primaryColor: AppColors.primaryColro,
    useMaterial3: true,
    textTheme: GoogleFonts.poppinsTextTheme(),
  );
}
