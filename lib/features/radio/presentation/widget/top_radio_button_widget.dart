
import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/features/radio/presentation/widget/button_radio_widget.dart';

class TopRadioButtonWidget extends StatelessWidget {
  const TopRadioButtonWidget({
    super.key,
    required this.activeCheck,
    required this.click1,
    required this.click2,
  });

  final String activeCheck;
  final VoidCallback click1;
  final VoidCallback click2;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      width: 390,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.kBlackColor.withAlpha(450),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ButtonRadioWidget(
            text: 'راديو',
            click: click1,
            active: activeCheck == 'radio' ? 'radio' : 'hide',
          ),
          ButtonRadioWidget(
            text: 'المفضلة',
            click: click2,
            active: activeCheck == 'radio' ? 'hide' : 'radio',
          ),
        ],
      ),
    );
  }
}