import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/core/utils/app_style.dart';

class ItemBooksWidget extends StatelessWidget {
  final VoidCallback click;
  final String text;
  const ItemBooksWidget({
    super.key,
    required List data,
    required this.click,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: click,
      child: Container(
        height: 55,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 1, color: AppColors.kCardContentColor)),
        child: Text(text, style: AppStyle.almarai24bold.copyWith(fontSize: 20)),
      ),
    );
  }
}
