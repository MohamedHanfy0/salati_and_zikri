import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/core/utils/assets.dart';

class BackGroundHadethWidget extends StatelessWidget {
  final Widget widget;
  const BackGroundHadethWidget({
    super.key,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [
          Container(
            height: 567,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Assets.assetsImagesBgHadeth))),
            child: Container(
              height: 567,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  AppColors.kBlackColor.withAlpha(450),
                  AppColors.kBlackColor,
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              ),
            ),
          ),
          SizedBox(child: widget)
        ],
      ),
    );
  }
}
