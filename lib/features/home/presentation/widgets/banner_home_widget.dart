
import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_style.dart';
import 'package:islami/core/utils/assets.dart';

class BannerHomeWidget extends StatelessWidget {
  const BannerHomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 132,
      padding: EdgeInsets.only(left: 39, top: 8, bottom: 7),
      width: double.infinity,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
            image: AssetImage(Assets.assetsImagesBanner1)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'الظهر',
            style: AppStyle.poppins12bold,
          ),
          Text(
            '11:45',
            style: AppStyle.poppins12bold
                .copyWith(fontSize: 32.37),
          ),
          Text(
            'الصلاة التالية: العصر',
            style: AppStyle.poppins12bold,
          ),
          Text(
            '2:50 مساءً',
            textDirection: TextDirection.rtl,
            style: AppStyle.poppins12bold,
          ),
        ],
      ),
    );
  }
}
