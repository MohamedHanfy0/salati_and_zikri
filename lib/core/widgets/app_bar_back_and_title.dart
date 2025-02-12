import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/core/utils/app_style.dart';

class AppBarBackAndTitle extends StatelessWidget {
   AppBarBackAndTitle({
    super.key,
    required this.title,this.widget
  });

  final String title;
  Widget? widget;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: AppColors.kPrimaryColor,
          ),
        ),
        Text(
          title,
          style: AppStyle.almarai24bold
              .copyWith(fontSize: 20, color: AppColors.kPrimaryColor),
        ),
        widget ?? SizedBox(),
      ],
    );
  }
}
