import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/core/utils/app_style.dart';
import 'package:islami/core/utils/assets.dart';

// ignore: must_be_immutable
class AppBarHadethWidget extends StatelessWidget {
  AppBarHadethWidget({
    super.key,
    required this.numberHadeth,
    required this.textHadeth,
    this.color,
  });

  final int numberHadeth;
  final String textHadeth;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          child: Image.asset(
            color: color ?? AppColors.kBlackColor,
            Assets.assetsImagesMosquBottom,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          // right: 0,
          left: 10,
          top: 10,
          child: Image.asset(
            Assets.assetsImagesCornerr1,
            color: color ?? AppColors.kBlackColor,
            width: 92,
            height: 93,
          ),
        ),
        Positioned(
          top: 40,
          right: 0,
          left: 0,
          child: Text(
            textAlign: TextAlign.center,
            '$numberHadeth رقم الحديث',
            style: AppStyle.janna24bold
                .copyWith(color: color ?? AppColors.kBlackColor),
          ),
        ),
        Positioned(
          right: 10,
          top: 10,
          child: Image.asset(
            color: color ?? AppColors.kBlackColor,
            Assets.assetsImagesCornerr2,
            width: 93,
            height: 92,
          ),
        ),
        Positioned(
          top: 105,
          left: 15,
          right: 15,
          child: Text(
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 15,
            textHadeth,
            style: AppStyle.janna18bold
                .copyWith(color: color ?? AppColors.kBlackColor, fontSize: 16),
          ),
        )
      ],
    );
  }
}
