part of 'startup_bloc.dart';

@immutable
sealed class StartupState {}

final class StartupInitial extends StartupState {}

final class StartupLoading extends StartupState {}

final class StartupSuccess extends StartupState {
  final String destination;
  final int id;

  StartupSuccess(this.destination, this.id);
}

final class StartupFailure extends StartupState {
  final String error;

  StartupFailure(this.error);
}
