part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeFailure extends HomeState {}

final class HomeLoaded extends HomeState {
  final List quran;

  HomeLoaded({required this.quran});
}
