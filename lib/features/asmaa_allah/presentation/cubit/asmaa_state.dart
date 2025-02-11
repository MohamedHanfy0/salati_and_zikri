part of 'asmaa_cubit.dart';

@immutable
sealed class AsmaaState {}

final class AsmaaInitial extends AsmaaState {}

final class AsmaaLoading extends AsmaaState {}
final class AsmaaFailure extends AsmaaState {}

final class AsmaaLoaded extends AsmaaState {
  final List asmaa;

  AsmaaLoaded({required this.asmaa});
}
