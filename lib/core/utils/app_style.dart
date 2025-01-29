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
        colors: [AppColors.gredient1, AppColors.gredient2],
      ).createShader(
        Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
      ),
  );
  static const TextStyle janna18bold = TextStyle(
      fontFamily: 'Janna',
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: AppColors.gredient2);
   static const TextStyle janna24bold = TextStyle(
      fontFamily: 'Janna',
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: AppColors.kGoldColor);
}
