import 'package:go_router/go_router.dart';
import 'package:islami/features/intro/presentation/views/intro_view.dart';
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
]);
