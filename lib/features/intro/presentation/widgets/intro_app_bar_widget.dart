
import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_style.dart';
import 'package:islami/core/utils/assets.dart';

class IntorAppBarWidget extends StatelessWidget {
  const IntorAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          Assets.assetsImagesMosque,
          width: 291,
          height: 151,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 88,
          left: 0,
          right: 0,
          child: Text(
              textAlign: TextAlign.center,
              "Salati And Zikri",
              style: AppStyle.kamali50.copyWith(fontSize: 35)),
        ),
      ],
    );
  }
}
