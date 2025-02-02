import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/core/utils/app_style.dart';
import 'package:islami/core/utils/assets.dart';

class MostRecentlyListWidget extends StatelessWidget {
  const MostRecentlyListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 160,
      width: double.infinity,
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        reverse: true,
        dragStartBehavior: DragStartBehavior.start,
        itemBuilder: (context, index) {
          return ItemMostRecentlyListWidget(
            artNumber: '٦٦',
            name: 'البقرة',
            nameNumber: '٦',
          );
        },
      ),
    );
  }
}

class ItemMostRecentlyListWidget extends StatelessWidget {
  final String artNumber;
  final String name;
  final String nameNumber;
  const ItemMostRecentlyListWidget({
    super.key,
    required this.artNumber,
    required this.name,
    required this.nameNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      padding: EdgeInsets.symmetric(horizontal: 9, vertical: 7),
      width: 283,
      height: 140,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: AppColors.kGoldColor),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: AppStyle.janna24bold
                      .copyWith(color: AppColors.kBlackColor),
                ),
                Text(
                  "$nameNumber رقم السورة",
                  style: AppStyle.janna18bold
                      .copyWith(color: AppColors.kBlackColor, fontSize: 14),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 5,
                  children: [
                    Text(
                      " اية",
                      style: AppStyle.janna18bold
                          .copyWith(color: AppColors.kBlackColor),
                    ),
                    Container(
                      width: 35,
                      height: 35,
                      padding: EdgeInsets.all(5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              Assets.assetsImagesArt,
                            ),
                            colorFilter: ColorFilter.mode(
                                AppColors.kBlackColor, BlendMode.srcIn)),
                      ),
                      child: Text(
                        artNumber,
                        style: AppStyle.janna18bold.copyWith(
                            color: AppColors.kBlackColor, fontSize: 11),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Image.asset(
            Assets.assetsImagesQuran,
          )
        ],
      ),
    );
  }
}
