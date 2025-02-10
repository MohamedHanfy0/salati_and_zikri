
import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/core/utils/app_style.dart';

class FramAyatWidget extends StatelessWidget {
  const FramAyatWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'سورة الفاتحة',
          style: AppStyle.almarai16bold.copyWith(
              fontSize: 14,
              color: AppColors.kPrimaryColor,
              fontWeight: FontWeight.normal),
        ),
        Text(
          'الآيات اليومية',
          style: AppStyle.almarai16bold,
        ),
      ],
    );
  }
}
