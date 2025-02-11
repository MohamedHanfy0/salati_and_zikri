
import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_colors.dart';

class FloatinButtonHadethWidget extends StatelessWidget {
  const FloatinButtonHadethWidget({
    super.key,
    required this.hadeth,
    required this.click,
  });

  final bool hadeth;
  final VoidCallback click;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: hadeth,
      child: Stack(
        children: [
          Positioned(
            top: 57,
            left: 24,
            child: FloatingActionButton(
              splashColor: AppColors.kSecondaryColor,
              backgroundColor: AppColors.kPrimaryColor,
              onPressed: click,
              child: Icon(
                Icons.arrow_back_ios,
                color: AppColors.kBackgroundColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
