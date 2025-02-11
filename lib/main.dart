import 'package:flutter/material.dart';
import 'package:islami/core/routes/router.dart';
import 'package:islami/core/services/services_locator.dart';
import 'package:islami/core/services/services_shared_preferences.dart';
import 'package:islami/core/utils/app_colors.dart';
import 'package:quran_library/quran.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  servicesLocator();
  await getIt<ServicesSharedPreferences>().init();
  QuranLibrary().init();
  
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.kPrimaryColor),
        scaffoldBackgroundColor: AppColors.kBackgroundColor,
        useMaterial3: true,
      ),
      routerConfig: goRouter,
    );
  }
}
