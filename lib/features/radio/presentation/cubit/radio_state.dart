part of 'radio_cubit.dart';

@immutable
sealed class RadioState {}

final class RadioInitial extends RadioState {}

final class RadioFailure extends RadioState {}

final class RadioLoading extends RadioState {}

final class RadioLoaded extends RadioState {
  final List radio;

  RadioLoaded({required this.radio});
}
