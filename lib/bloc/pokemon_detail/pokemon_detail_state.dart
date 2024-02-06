part of 'pokemon_detail_bloc.dart';

@immutable
sealed class PokemonDetailState {}

final class PokemonDetailInitial extends PokemonDetailState {}

final class PokemonDetailSuccess extends PokemonDetailState {
  final PokemonDetailModel data;

  PokemonDetailSuccess(this.data);
}

final class PokemonDetailFailure extends PokemonDetailState {
  final String error;

  PokemonDetailFailure(this.error);
}
