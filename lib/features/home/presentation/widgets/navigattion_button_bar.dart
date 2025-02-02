import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/core/utils/app_style.dart';
import 'package:islami/core/utils/assets.dart';
import 'package:islami/features/hadith/presentation/views/hadith_view.dart';
import 'package:islami/features/home/presentation/views/home_view.dart';
import 'package:islami/features/quran/presentation/views/quran_view.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

PersistentTabController _controller = PersistentTabController(initialIndex: 0);

class NavigattionButtonBar extends StatelessWidget {
  const NavigattionButtonBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: PersistentTabView(
        navBarHeight: 80,
        context,
        screens: _buildScreens(),
        controller: _controller,
        items: _navBarsItems(),
        navBarStyle: NavBarStyle.style12,
        backgroundColor: AppColors.kGoldColor,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          // colorBehindNavBar: Colors.white,
        ),
      ),
    );
  }
}

List<Widget> _buildScreens() {
  return [
    HomeView(),
    QuranView(),
    HadithView(),
    HomeView(),
    HomeView(),
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    itemBar(
        image: Assets.assetsImagesItem1, text: 'القران', width: 19, height: 22),
    itemBar(
        image: Assets.assetsImagesItem2, text: 'حديث', width: 22, height: 22),
    itemBar(
        image: Assets.assetsImagesItem3, text: 'سبحة', width: 32, height: 32),
    itemBar(
        image: Assets.assetsImagesItem4,
        text: 'اذاعة القران',
        width: 25,
        height: 26),
    itemBar(
        image: Assets.assetsImagesItem5,
        text: 'اوقات الصلاة',
        width: 27,
        height: 27),
  ];
}

PersistentBottomNavBarItem itemBar(
    {required String image,
    required String text,
    required double width,
    required double height}) {
  return PersistentBottomNavBarItem(
      inactiveIcon: SvgPicture.asset(
        image,
        // ignore: deprecated_member_use
        color: AppColors.kBlackColor,
        width: width,
        height: height,
      ),
      icon: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 59,
            height: 34,
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(66),
                color: AppColors.kBlackColor.withAlpha(420)),
            child: SvgPicture.asset(
              image,
              // ignore: deprecated_member_use
              color: Colors.white,
            ),
          ),
          Text(
            text,
            style: AppStyle.janna12bold,
          )
        ],
      ));
}
