part of 'pokemon_bloc.dart';

@immutable
sealed class PokemonEvent {}

final class PokemonFetched extends PokemonEvent {
  final int limit;
  final int offset;

  PokemonFetched(this.limit, this.offset);
}
