part of 'pokemon_berry_bloc.dart';

@immutable
sealed class PokemonBerryEvent {}

final class BerryFetched extends PokemonBerryEvent {
  BerryFetched();
}

final class BerrySelected extends PokemonBerryEvent {
  final List<PokemonBerryModel> data;
  final int index;

  BerrySelected(this.data, this.index);
}
