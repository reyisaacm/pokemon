part of 'pokemon_bloc.dart';

@immutable
sealed class PokemonEvent {}

final class PokemonFetched extends PokemonEvent {}
