import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/core/utils/assets.dart';
import 'package:islami/core/widgets/intro_app_bar_widget.dart';
import 'package:islami/features/home/presentation/widgets/most_recently_list_widget.dart';
import 'package:islami/features/home/presentation/widgets/most_recently_widget.dart';
import 'package:islami/core/widgets/search_bar_widget.dart';
import 'package:islami/features/home/presentation/widgets/sura_list_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(Assets.assetsImagesBgHome),
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.kBlackColor.withAlpha(430),
            ),
            child: Column(
              children: [
                SizedBox(height: 20),
                IntorAppBarWidget(),
                SearchBarWidget(
                  hintText: 'اسم السورة',
                  icon: Assets.assetsImagesItem1, seach: (value) {  }, controller: textEditingController,
                ),
                MostRecently(
                  name: "في الآونة الأخيرة ",
                ),
                MostRecentlyListWidget(),
                MostRecently(
                  name: "قائمة السور",
                ),
                SuraList()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
