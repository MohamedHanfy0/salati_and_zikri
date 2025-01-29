import 'package:flutter/material.dart';
import 'package:islami/core/routes/router.dart';
import 'package:islami/core/services/services_locator.dart';
import 'package:islami/core/services/services_shared_preferences.dart';
import 'package:islami/core/utils/app_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  servicesLocator();
  await getIt<ServicesSharedPreferences>().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.kGoldColor),
        scaffoldBackgroundColor: AppColors.kBlackColor,
        useMaterial3: true,
      ),
      routerConfig: goRouter,
    );
  }
}
