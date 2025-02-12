import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/core/utils/app_style.dart';

class ButtonPageViewHomeWidget extends StatelessWidget {
  const ButtonPageViewHomeWidget({
    super.key,
    required this.title,
    required this.isVisibilty,
  });
  final String title;
  final bool isVisibilty;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      alignment: Alignment.center,
      height: double.infinity,
      width: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: isVisibilty ? AppColors.kPajeColor : Colors.transparent,
      ),
      child: Text(
        title,
        style: AppStyle.almarai16bold
            .copyWith(fontSize: 14)
            .copyWith(color: AppColors.kBackgroundColor),
      ),
    );
  }
}
