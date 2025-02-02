import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/core/utils/assets.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 55,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.kBlackColor.withAlpha(400),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.kGoldColor, width: 1),
      ),
      child: TextField(
        autofocus: false,
        cursorColor: AppColors.gredient2,
        textAlignVertical: TextAlignVertical.center,
        textDirection: TextDirection.rtl,
        style: TextStyle(
            color: Colors.white,
            fontFamily: 'Janna',
            fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          hintText: 'اسم السورة',
          hintTextDirection: TextDirection.rtl,
          hintStyle: TextStyle(color: Color.fromARGB(255, 180, 175, 175)),
          suffixIcon: Padding(
            padding: EdgeInsets.all(12),
            // ignore: deprecated_member_use
            child: SvgPicture.asset(Assets.assetsImagesItem1,
                // ignore: deprecated_member_use
                color: AppColors.gredient2),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
