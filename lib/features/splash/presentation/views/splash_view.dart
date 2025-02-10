import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:islami/core/services/services_locator.dart';
import 'package:islami/core/services/services_shared_preferences.dart';
import 'package:islami/core/utils/app_colors.dart';
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

    checkIntro
        ? dyloadNavigat(context, '/home')
        : dyloadNavigat(context, '/intro');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      color: AppColors.kBackgroundColor,
      child: Image.asset(Assets.assetsImagesIntro),
    ));
  }
}

void dyloadNavigat(context, String path) {
  Future.delayed(Duration(seconds: 3), () {
    GoRouter.of(context).pushReplacement(path);
  });
}
