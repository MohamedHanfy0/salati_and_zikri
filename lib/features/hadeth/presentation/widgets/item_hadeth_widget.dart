// ignore: camel_case_types
import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/core/utils/app_style.dart';
import 'package:islami/core/utils/assets.dart';
import 'package:islami/features/hadeth/presentation/views/hadeth_preview_view.dart';
import 'package:islami/features/hadeth/presentation/widgets/app_bar_hadeth_widget.dart';

class ItemHadethWidget extends StatelessWidget {
  final String textHadeth;
  final int numberHadeth;
  const ItemHadethWidget(
      {super.key, required this.textHadeth, required this.numberHadeth});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return BodyDialogHadeth(
              text: textHadeth,
              number: numberHadeth,
            );
          },
        );
        HadethPreviewView(
          number: numberHadeth,
          text: textHadeth,
        );
      },
      child: Expanded(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          width: 313,
          decoration: BoxDecoration(
              image: DecorationImage(
                  opacity: 0.8,
                  image: AssetImage(Assets.assetsImagesHadithCardBackGround)),
              borderRadius: BorderRadius.circular(20),
              color: AppColors.kGoldColor),
          child: AppBarHadethWidget(
              numberHadeth: numberHadeth, textHadeth: textHadeth),
        ),
      ),
    );
  }
}

class BodyDialogHadeth extends StatelessWidget {
  final String text;
  final int number;

  const BodyDialogHadeth({
    super.key,
    required this.text,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: AppColors.kBlackColor,
          ),
          padding: EdgeInsets.all(18),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    Assets.assetsImagesCornerr1,
                    color: AppColors.kGoldColor,
                  ),
                  Text(
                    "الحديث  $number",
                    style: AppStyle.janna24bold
                        .copyWith(color: AppColors.kGoldColor),
                  ),
                  Image.asset(
                    Assets.assetsImagesCornerr2,
                    color: AppColors.kGoldColor,
                  )
                ],
              ),
              Text(
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
                text,
                style:
                    AppStyle.janna24bold.copyWith(color: AppColors.kGoldColor),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          child: Image.asset(
            Assets.assetsImagesMosquBottom,
            width: double.infinity,
            fit: BoxFit.cover,
            color: AppColors.kGoldColor.withAlpha(420),
          ),
        ),
      ],
    );
  }
}
