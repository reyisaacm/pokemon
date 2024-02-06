part of 'pokemon_detail_bloc.dart';

@immutable
sealed class PokemonDetailEvent {}

final class PokemonDetailFetched extends PokemonDetailEvent {
  final int id;

  PokemonDetailFetched(this.id);
}
