part of 'pokemon_berry_bloc.dart';

@immutable
sealed class PokemonBerryEvent {}

final class BerryFetched extends PokemonBerryEvent {
  BerryFetched();
}
