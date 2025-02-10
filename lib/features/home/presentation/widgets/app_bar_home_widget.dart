
import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/core/utils/app_style.dart';
import 'package:islami/core/utils/assets.dart';

class AppBarHomeWidget extends StatelessWidget {
  const AppBarHomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(Assets.assetsImagesSearch),
        Row(
          spacing: 16,
          children: [
            Text(
              'القرآن الكريم',
              style: AppStyle.almarai24bold.copyWith(
                  fontSize: 20, color: AppColors.kPrimaryColor),
            ),
            Image.asset(Assets.assetsImagesMenuHamburger)
          ],
        ),
      ],
    );
  }
}
