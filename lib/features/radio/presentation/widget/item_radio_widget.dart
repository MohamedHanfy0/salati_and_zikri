import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/core/utils/app_style.dart';
import 'package:islami/core/utils/assets.dart';

class ItemRadioWidget extends StatelessWidget {
  const ItemRadioWidget({
    super.key,
    required this.name,
    required this.play,
    required this.like,
    required this.volum,
    required this.mute,
    required this.isPly,
    required this.disLike,
  });

  final String name;
  final bool mute;
  final bool isPly;
  final bool disLike;
  final VoidCallback play;
  final VoidCallback like;
  final VoidCallback volum;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390,
      height: 133,
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.kPrimaryColor,
      ),
      child: Stack(children: [
        // Positioned(
        //   top: 50,
        //   child: SizedBox(
        //     // alignment: Alignment.bottomCenter,
        //     // color: Colors.amber,
        //     height: isPly ? 120 : 97,
        //     width: 390,
        //     child: Image.asset(

        //       width: double.infinity,
        //       fit: BoxFit.fitHeight,
        //       alignment: Alignment.bottomCenter,
        //     ),
        //   ),
        // ),
        Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Text(
              name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
              style: AppStyle.almarai24bold
                  .copyWith(color: AppColors.kBackgroundColor, fontSize: 20),
            ),
            SizedBox(
              height: 32,
            ),
            Row(
              spacing: 25,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: like,
                  child: Image.asset(
                    disLike
                        ? Assets.assetsImagesElbsmalh
                        : Assets.assetsImagesElbsmalh,
                    width: 32,
                    height: 29,
                  ),
                ),
                GestureDetector(
                  onTap: play,
                  child: Image.asset(
                    isPly
                        ? Assets.assetsImagesElbsmalh
                        : Assets.assetsImagesElbsmalh,
                    width: 31,
                    height: 31,
                  ),
                ),
                GestureDetector(
                  onTap: volum,
                  child: Image.asset(
                    // Assets.assetsImagesVolumeHigh,
                    mute
                        ? Assets.assetsImagesElbsmalh
                        : Assets.assetsImagesElbsmalh,
                    width: 30,
                    height: 30,
                  ),
                ),
              ],
            ),
          ],
        ),
      ]),
    );
  }
}
