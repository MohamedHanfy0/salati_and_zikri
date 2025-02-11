import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/core/utils/app_style.dart';
import 'package:islami/core/utils/assets.dart';
import 'package:islami/features/home/presentation/widgets/app_bar_home_widget.dart';
import 'package:islami/features/home/presentation/widgets/banner_home_widget.dart';
import 'package:islami/features/home/presentation/widgets/button_page_view_home_widget.dart';
import 'package:islami/features/home/presentation/widgets/fram_ayat_widget.dart';
import 'package:islami/features/home/presentation/widgets/page_view_home_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    List allOption = [
      {
        'name': 'أسماء الله الحسني',
        'icon': Assets.assetsImagesAsmaaAllah,
        'path': '/asmaa'
      },
      {
        'name': 'التسبيح الالكتروني',
        'icon': Assets.assetsImagesSebha,
        'path': '/subha'
      },
      {
        'name': 'راديو',
        'icon': Assets.assetsImagesRadio,
        'path': '/radio',
      },
      {
        'name': 'الأحاديث',
        'icon': Assets.assetsImagesHadeth,
        'path': '/hadeth'
      },
      {
        'name': 'الأذكار',
        'icon': Assets.assetsImagesAzkar,
        'path': '/azkar',
      },
      {
        'name': 'القرأن',
        'icon': Assets.assetsImagesElqran,
        'path': '/quran',
      },
    ];
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.all(24),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  spacing: 17,
                  children: [
                    SizedBox(
                      height: 21,
                    ),
                    AppBarHomeWidget(),
                    BannerHomeWidget(),
                    FramAyatWidget(),
                    PageViewHomeWidget(pageController: pageController),
                    Container(
                      height: 41,
                      width: double.infinity,
                      padding: EdgeInsets.all(4.5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.kPrimaryColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ButtonPageViewHomeWidget(),
                          ButtonPageViewHomeWidget(),
                          ButtonPageViewHomeWidget(),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 300,
                      child: PageView(
                        reverse: true,
                        children: [
                          GridView.builder(
                            itemCount: allOption.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisSpacing: 7.5,
                                    crossAxisCount: 3,
                                    mainAxisSpacing: 16),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  GoRouter.of(context)
                                      .push(allOption[index]['path']);
                                },
                                child: Container(
                                  width: 110,
                                  height: 124,
                                  padding: EdgeInsets.only(bottom: 2),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: AppColors.kPrimaryColor,
                                  ),
                                  child: Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: AppColors.kSecondaryColor),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      spacing: 16,
                                      children: [
                                        Image.asset(
                                          allOption[index]['icon'],
                                          width: 50,
                                          height: 50,
                                        ),
                                        Text(
                                          allOption[index]['name'],
                                          textDirection: TextDirection.rtl,
                                          overflow: TextOverflow.ellipsis,
                                          style:
                                              AppStyle.almarai16bold.copyWith(
                                            fontSize: 14,
                                            color: AppColors.kPrimaryColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          Container(),
                          SizedBox(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
