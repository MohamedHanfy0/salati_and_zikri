// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:islami/core/utils/app_colors.dart';

class SearchBarWidget extends StatelessWidget {
  final String hintText;
  final String icon;
  final void Function(String)? seach;
  final TextEditingController controller;
  const SearchBarWidget({
    super.key,
    required this.hintText,
    required this.icon,
    required this.seach,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 55,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.kBackgroundColor.withAlpha(400),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.kPrimaryColor, width: 1),
      ),
      child: TextField(
        controller: controller,
        autofocus: false,
        cursorColor: AppColors.kCardContentColor,
        textAlignVertical: TextAlignVertical.center,
        textDirection: TextDirection.rtl,
        style: TextStyle(
            color: Colors.white,
            fontFamily: 'Janna',
            fontWeight: FontWeight.bold),
        onChanged: seach,
        decoration: InputDecoration(
          hintText: hintText,
          hintTextDirection: TextDirection.rtl,
          hintStyle: TextStyle(color: Color.fromARGB(255, 224, 219, 219)),
          suffixIcon: Padding(
            padding: EdgeInsets.all(12),
            // ignore: deprecated_member_use
            child: Image.asset(icon,
                // ignore: deprecated_member_use
                color: AppColors.kCardContentColor),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
