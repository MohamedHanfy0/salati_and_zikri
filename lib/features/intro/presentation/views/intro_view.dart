import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:islami/core/services/services_shared_preferences.dart';
import 'package:islami/core/utils/app_style.dart';
import 'package:islami/core/utils/assets.dart';

class IntroView extends StatelessWidget {
  const IntroView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
                child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                spacing: 20,
                children: [
                  SizedBox(
                    height: 115,
                  ),
                  Image.asset(
                    Assets.assetsImagesElbsmalh,
                    width: 300,
                    height: 58,
                  ),
                  Image.asset(
                    Assets.assetsImagesIntro,
                    width: 345,
                    height: 298,
                  ),
                  Column(
                    spacing: 16,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'تطبيق العبادات',
                        style: AppStyle.almarai24bold,
                      ),
                      Text(
                        'تعلم الدين الاسلامي عن طريق تصنيفات وملفات وشروحات ومحاضرات ٫٫الخ , يوفر أوقات الصلاة وخطب والقرآن الكريم كامل مع توفير تفسير وقراءة بالصوت ٫٫ اكتشف المزيد بنفسك',
                        style: AppStyle.almarai16bold
                            .copyWith(color: Colors.black.withAlpha(360)),
                        textAlign: TextAlign.end,
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      
                      GoRouter.of(context).pushReplacement('/home');
                      ServicesSharedPreferences().saveData('intro', true);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 42,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(width: 1, color: Colors.black)),
                      child: Text(
                        "أبدأ الآن",
                        style: AppStyle.almarai16bold
                            .copyWith(fontWeight: FontWeight.w100),
                      ),
                    ),
                  )
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
