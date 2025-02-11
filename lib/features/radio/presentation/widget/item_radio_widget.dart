import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/core/utils/app_style.dart';
import 'package:squiggly_slider/slider.dart';

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
      // width: 390,
      height: 77,
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: 0, right: 0, bottom: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.kSecondaryColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                  style: AppStyle.almarai24bold
                      .copyWith(color: AppColors.kPrimaryColor, fontSize: 14),
                ),
              ),
              Visibility(
                visible: isPly,
                child: SquigglySlider(
                  //... normal Slider Widget properties ...
                  max: 100,
                  squiggleAmplitude: 5.0,
                  squiggleWavelength: 5.0,
                  squiggleSpeed: 0.3, value: 100, onChanged: (double value) {},
                ),
              ),
            ],
          ),
          Row(
            spacing: 20,
            children: [
              GestureDetector(
                onTap: like,
                child: Icon(
                  disLike ? Icons.favorite : Icons.favorite_border,
                  color: AppColors.kPrimaryColor,
                ),
              ),
              GestureDetector(
                onTap: play,
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: AppColors.kPajeColor),
                  child: Icon(
                    isPly ? Icons.pause : Icons.play_arrow_rounded,
                    color: AppColors.kSecondaryColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
