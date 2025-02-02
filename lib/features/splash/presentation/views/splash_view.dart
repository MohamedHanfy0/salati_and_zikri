import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:islami/core/services/services_locator.dart';
import 'package:islami/core/services/services_shared_preferences.dart';
import 'package:islami/core/utils/app_style.dart';
import 'package:islami/core/utils/assets.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    bool checkIntro =
        getIt<ServicesSharedPreferences>().getData(key: 'intro') ?? false;
    print('3333333333333333333333');
    print(checkIntro);
    checkIntro
        ? dyloadNavigat(context, '/navi')
        : dyloadNavigat(context, '/intro');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              Assets.assetsImagesBackground,
            ),
          ),
        ),
        child: Stack(
          children: [
            SizedBox(
              height: 57,
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 57,
              child: Image.asset(
                Assets.assetsImagesMosque,
                width: 291,
                height: 193,
              ),
            ),
            Positioned(
              top: 214,
              child: Image.asset(
                Assets.assetsImagesShape,
                width: 87,
                height: 187,
              ),
            ),
            Positioned(
              top: 0,
              right: 13,
              child: Image.asset(Assets.assetsImagesGlow),
            ),
            Positioned(
                top: 341,
                left: 0,
                right: 0,
                child: SvgPicture.asset(
                  Assets.assetsImagesOBJECTS,
                  width: 173.72,
                  height: 154.86,
                )),
            Positioned(
              top: 500,
              right: 0,
              left: 0,
              child: Text(
                  textAlign: TextAlign.center,
                  "Salati And Zikri",
                  style: AppStyle.kamali50),
            ),
            Positioned(
              top: 604,
              right: 0,
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()..scale(-1.0, 1.0),
                child: Image.asset(
                  Assets.assetsImagesShape,
                  width: 101,
                  height: 216,
                ),
              ),
            ),
            Positioned(
              top: 550,
              left: 0,
              right: 0,
              child: Text(
                textAlign: TextAlign.center,
                "صلاتي وذكري",
                style: AppStyle.janna18bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void dyloadNavigat(context, String path) {
  Future.delayed(Duration(seconds: 3), () {
    GoRouter.of(context).pushReplacement(path);
  });
}
