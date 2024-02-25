part of 'pokemon_detail_bloc.dart';

@immutable
sealed class PokemonDetailEvent {}

final class PokemonDetailFetched extends PokemonDetailEvent {
  final int id;
  PokemonDetailFetched(this.id);
}

final class PokemonDetailEvolved extends PokemonDetailEvent {
  final int id;
  final int weight;
  PokemonDetailEvolved(this.id, this.weight);
}
