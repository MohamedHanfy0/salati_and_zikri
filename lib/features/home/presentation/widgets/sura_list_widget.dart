import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/core/utils/app_style.dart';
import 'package:islami/core/utils/assets.dart';

class SuraList extends StatelessWidget {
  const SuraList({
    super.key,
    required this.jsonData,
  });
  final List jsonData;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: jsonData.length,
        itemBuilder: (context, index) {
          return SuraItem(
            name: jsonData[index]['name'],
            suraNumber: jsonData[index]['number'],
            artNumber: jsonData[index]['numberOfAyahs'],
          );
        },
      ),
    );
  }
}

class SuraItem extends StatelessWidget {
  final String name;
  final int suraNumber;
  final int artNumber;
  const SuraItem({
    super.key,
    required this.name,
    required this.suraNumber,
    required this.artNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 21),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                    color: AppColors.kBlackColor.withAlpha(450),
                    border: Border.all(width: 1, color: AppColors.kBlackColor)),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 5,
                  children: [
                    Text(
                      " اية",
                      style: AppStyle.janna18bold
                          .copyWith(color: Colors.white, fontSize: 15),
                    ),
                    Text(
                      artNumber.toString(),
                      style: AppStyle.janna18bold
                          .copyWith(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    name,
                    style: AppStyle.janna24bold.copyWith(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'arsura'),
                  ),
                ),
              ),
              SizedBox(
                width: 30,
              ),
              Container(
                width: 52,
                height: 52,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      Assets.assetsImagesArt,
                    ),
                    colorFilter:
                        ColorFilter.mode(AppColors.kBlackColor, BlendMode.dst),
                  ),
                ),
                child: Text(
                  suraNumber.toString(),
                  style: AppStyle.janna24bold
                      .copyWith(fontSize: 16, color: Colors.white),
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 35),
            height: 1,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
