import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/core/utils/assets.dart';
import 'package:islami/core/widgets/intro_app_bar_widget.dart';
import 'package:islami/core/widgets/search_bar_widget.dart';

class HadethView extends StatelessWidget {
  const HadethView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
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
                    AppColors.kBlackColor.withAlpha(420),
                    AppColors.kBlackColor,
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                ),
              ),
            ),
            SizedBox(
              child: Column(
                children: [
                  SizedBox(
                    height: 57,
                  ),
                  IntorAppBarWidget(),
                  SearchBarWidget(
                    hintText: 'اسم الحديث',
                    icon: Assets.assetsImagesItem2,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
