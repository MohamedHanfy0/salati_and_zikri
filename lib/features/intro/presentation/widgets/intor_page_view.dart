import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:islami/core/services/services_shared_preferences.dart';
import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/core/utils/app_style.dart';
import 'package:islami/core/utils/assets.dart';
import 'package:islami/core/widgets/text_button_widget.dart';
import 'package:islami/features/intro/model/model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroPageView extends StatelessWidget {
  const IntroPageView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = PageController();

    List<Intro> intro = [
      Intro(
          image: Assets.assetsImagesKabba,
          title: 'مرحبا بكم في صلاتي وزكري',
          subTitle: 'نحن متحمسون جدًا لوجودك في مجتمعنا'),
      Intro(
          image: Assets.assetsImagesWelcome1,
          title: 'قراءة القرآن',
          subTitle: 'اقرأ وربك الأكرم'),
      Intro(
          image: Assets.assetsImagesWelcome2,
          title: 'سبحة',
          subTitle: 'سبح اسم ربك الأعلى'),
      Intro(
          image: Assets.assetsImagesWelcome3,
          title: 'إذاعة القرآن الكريم',
          subTitle:
              'يمكنك الاستماع إلى إذاعة القرآن الكريم من خلال التطبيق مجانًا وبسهولة'),
    ];

    return SizedBox(
      height: MediaQuery.of(context).size.height - 208.0,
      child: PageView.builder(
        controller: controller,
        itemCount: intro.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Image.asset(
                intro[index].image,
                width: 300,
                height: 300,
                color: AppColors.kGoldColor,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                intro[index].title,
                style: AppStyle.janna24bold,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                textAlign: TextAlign.center,
                intro[index].subTitle,
                style: AppStyle.janna24bold.copyWith(fontSize: 20),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 16, right: 16, bottom: 24),
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Visibility(
                        visible: index == 0 ? false : true,
                        child: TextButtonWidget(
                          click: () {
                            controller.previousPage(
                                duration: Duration(microseconds: 5000),
                                curve: Curves.linear);
                          },
                          text: 'Back',
                        ),
                      ),
                      SmoothPageIndicator(
                        controller: controller,
                        count: 4, // Adjust based on the number of pages
                        effect: ExpandingDotsEffect(
                            dotHeight: 6,
                            dotWidth: 10,
                            activeDotColor:
                                AppColors.kGoldColor), // your preferred effect
                      ),
                      TextButtonWidget(
                        click: () async {
                          if (index == 3) {
                            await ServicesSharedPreferences()
                                .saveData('intro', true);
                            // ignore: use_build_context_synchronously
                            context.replace('/navi');
                          } else {
                            controller.nextPage(
                                duration: Duration(microseconds: 5000),
                                curve: Curves.linear);
                          }
                        },
                        text: index == 3 ? 'Finish' : 'Next',
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
