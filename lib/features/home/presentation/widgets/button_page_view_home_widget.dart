
import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/core/utils/app_style.dart';

class ButtonPageViewHomeWidget extends StatelessWidget {
  
  const ButtonPageViewHomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      alignment: Alignment.center,
      height: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.kPajeColor,
      ),
      child: Text(
        'كل الوسائط',
        style: AppStyle.almarai16bold
            .copyWith(fontSize: 14)
            .copyWith(color: AppColors.kBackgroundColor),
      ),
    );
  }
}
