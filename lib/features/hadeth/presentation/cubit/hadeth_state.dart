part of 'hadeth_cubit.dart';

@immutable
sealed class HadethState {}

final class HadethInitial extends HadethState {}

final class HadethFailure extends HadethState {}

final class HadethLoading extends HadethState {}

final class HadethLoaded extends HadethState {
  final List chapters;
  final List hadith;
  

  HadethLoaded( {required this.chapters,required this.hadith});
}
