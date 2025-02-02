import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/core/utils/app_style.dart';
import 'package:islami/core/utils/assets.dart';

class SuraList extends StatelessWidget {
  const SuraList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // height: MediaQuery.of(context).size.height - 300.0,
      child: ListView.builder(
        itemCount: 55,
        itemBuilder: (context, index) {
          return SuraItem(
            name: 'الفاتحة',
            suraNumber: '٦٦',
            artNumber: '٦٦٦',
          );
        },
      ),
    );
  }
}

class SuraItem extends StatelessWidget {
  final String name;
  final String suraNumber;
  final String artNumber;
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
              Expanded(
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 5,
                  children: [
                    Text(
                      " اية",
                      style: AppStyle.janna18bold
                          .copyWith(color: Colors.white, fontSize: 15),
                    ),
                    Container(
                      width: 22,
                      height: 22,
                      padding: EdgeInsets.all(5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              Assets.assetsImagesArt,
                            ),
                            colorFilter: ColorFilter.mode(
                                Colors.white, BlendMode.srcIn)),
                      ),
                      child: Text(
                        artNumber,
                        style: AppStyle.janna18bold
                            .copyWith(color: Colors.white, fontSize: 9),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                child: Text(
                  name,
                  style: AppStyle.janna24bold
                      .copyWith(color: Colors.white, fontSize: 20),
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
                  "٦٦٦",
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
