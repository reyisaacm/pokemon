part of 'pokemon_berry_bloc.dart';

@immutable
sealed class PokemonBerryState {}

final class PokemonBerryInitial extends PokemonBerryState {}

final class PokemonBerrySuccess extends PokemonBerryState {
  final List<PokemonBerryModel> listData;

  PokemonBerrySuccess(this.listData);
}

final class PokemonBerryFailure extends PokemonBerryState {
  final String error;

  PokemonBerryFailure(this.error);
}

final class PokemonBerryLoading extends PokemonBerryState {}
