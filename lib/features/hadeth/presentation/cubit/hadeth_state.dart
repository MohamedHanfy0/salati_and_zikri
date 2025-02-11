part of 'hadeth_cubit.dart';

@immutable
sealed class HadethState {}

final class HadethInitial extends HadethState {}

final class HadethFailure extends HadethState {}

final class HadethLoading extends HadethState {}

final class HadethLoaded extends HadethState {
  final List hadeth;
  final List chapters;

  HadethLoaded({required this.chapters,required this.hadeth});
}
