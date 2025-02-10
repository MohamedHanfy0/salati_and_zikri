import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_colors.dart';

class AppStyle {
  static TextStyle kamali50 = TextStyle(
    fontFamily: 'Kamali',
    fontSize: 50,
    fontWeight: FontWeight.bold,
    foreground: Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [AppColors.kPajeColor, AppColors.kCardContentColor],
      ).createShader(
        Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
      ),
  );
  static const TextStyle almarai16bold = TextStyle(
      fontFamily: 'Almarai',
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.black);
  static const TextStyle almarai24bold = TextStyle(
      fontFamily: 'Almarai',
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.black);
  static const TextStyle poppins12bold = TextStyle(
      fontFamily: 'Poppins',
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: AppColors.kPrimaryColor);
  static const TextStyle janna36bold = TextStyle(
      fontFamily: 'Janna',
      fontSize: 36,
      fontWeight: FontWeight.bold,
      color: Colors.white);
  static const TextStyle digital50regular = TextStyle(
      fontFamily: 'digital', fontSize: 50, color: AppColors.kPrimaryColor);
}
