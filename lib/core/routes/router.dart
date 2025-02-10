import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:islami/features/hadeth/presentation/cubit/hadeth_cubit.dart';
import 'package:islami/features/hadeth/presentation/views/hadeth_preview_view.dart';
import 'package:islami/features/hadeth/presentation/views/hadeth_view.dart';
import 'package:islami/features/home/presentation/views/home_view.dart';
import 'package:islami/features/intro/presentation/views/intro_view.dart';
import 'package:islami/features/radio/presentation/views/radio_view.dart';
import 'package:islami/features/splash/presentation/views/splash_view.dart';
import 'package:islami/features/subha/presentation/views/subha_view.dart';

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
  GoRoute(path: '/navi', builder: (context, state) => HomeView()),
  GoRoute(
    path: '/radio',
    builder: (context, state) => RadioView(),
  ),
  GoRoute(
    path: '/subha',
    builder: (context, state) => SubhaView(),
  ),
  GoRoute(
    path: '/hadeth',
    builder: (context, state) => BlocProvider(
      create: (context) => HadethCubit()..loadHaiths(),
      child: HadethView(),
    ),
  ),
]);
