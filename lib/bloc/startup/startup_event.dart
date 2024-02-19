part of 'startup_bloc.dart';

@immutable
sealed class StartupEvent {}

final class StartupLoaded extends StartupEvent {}
