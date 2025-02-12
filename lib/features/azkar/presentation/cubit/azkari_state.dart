part of 'azkari_cubit.dart';

@immutable
sealed class AzkariState {}

final class AzkariInitial extends AzkariState {}

final class AzkariLoading extends AzkariState {}

final class AzkariLoaded extends AzkariState {
  final List azkari;

  AzkariLoaded({required this.azkari});
}

final class AzkariFailure extends AzkariState {}
