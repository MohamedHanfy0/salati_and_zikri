import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/core/utils/app_style.dart';

class ButtonLabelIcon extends StatelessWidget {
  const ButtonLabelIcon({
    super.key,
    required this.text,
    required this.icon,
    required this.click,
  });

  final String text;
  final Icon icon;
  final VoidCallback click;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: click,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.gredient2,
        ),
        child: Row(
          spacing: 5,
          children: [
            Text(
              text,
              style:
                  AppStyle.janna18bold.copyWith(color: AppColors.kBlackColor),
            ),
            icon,
          ],
        ),
      ),
    );
  }
}
