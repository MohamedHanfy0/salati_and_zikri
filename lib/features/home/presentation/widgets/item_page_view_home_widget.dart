
import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/core/utils/app_style.dart';

class ItemPageViewWidget extends StatelessWidget {
  const ItemPageViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: Color(0xffFFB57D)),
      child: Container(
        padding: EdgeInsets.all(19),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.kDarkColor,
        ),
        child: Column(
          spacing: 13,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.share,
                  color: AppColors.kBackgroundColor,
                ),
                Text(
                  'الحمدلله رب العالمين',
                  style: AppStyle.almarai24bold
                      .copyWith(color: AppColors.kBackgroundColor),
                )
              ],
            ),
            Text(
              'All praise and thanks be to the Lord of the worlds.',
              style: AppStyle.poppins12bold
                  .copyWith(fontSize: 16, color: AppColors.kBackgroundColor),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "سورة الفاتحة - الجزء الثلاثون  - آية ١",
                style: AppStyle.almarai16bold
                    .copyWith(fontSize: 10, color: AppColors.kBackgroundColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
