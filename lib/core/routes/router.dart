import 'package:go_router/go_router.dart';
import 'package:islami/features/home/presentation/views/home_view.dart';
import 'package:islami/features/home/presentation/widgets/navigattion_button_bar.dart';
import 'package:islami/features/intro/presentation/views/intro_view.dart';
import 'package:islami/features/radio/presentation/views/radio_view.dart';
import 'package:islami/features/splash/presentation/views/splash_view.dart';

final GoRouter goRouter = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => SplashView(),
  ),
  GoRoute(
    path: '/intro',
    builder: (context, state) => IntroView(),
  ),
  GoRoute(
    path: '/home',
    builder: (context, state) => HomeView(),
  ),

  GoRoute(
    path: '/navi',
    builder: (context, state) => NavigattionButtonBar(),
  ),
  GoRoute(
    path: '/radio',
    builder: (context, state) => RadioView(),
  ),
]);
