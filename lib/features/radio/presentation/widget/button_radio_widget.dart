import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/core/utils/app_style.dart';

class ButtonRadioWidget extends StatelessWidget {
  final String text;
  final VoidCallback click;
  final String active;
  const ButtonRadioWidget({
    super.key,
    required this.text,
    required this.click,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: click,
      child: Container(
        alignment: Alignment.center,
        width: 185,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color:
              active == 'radio' ? AppColors.kPrimaryColor : Colors.transparent,
        ),
        child: Text(
          text,
          style: AppStyle.almarai16bold.copyWith(
              color: active == 'radio'
                  ? AppColors.kBackgroundColor
                  : Colors.white),
        ),
      ),
    );
  }
}
