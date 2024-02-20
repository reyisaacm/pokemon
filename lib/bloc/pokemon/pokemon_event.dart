part of 'pokemon_bloc.dart';

@immutable
sealed class PokemonEvent {}

final class PokemonFetched extends PokemonEvent {
  final int limit;
  final int offset;
  final String? search;

  PokemonFetched(this.limit, this.offset, this.search);
}

final class PokemonSelected extends PokemonEvent {
  final List<PokemonListItemModel> data;
  final int index;

  PokemonSelected(this.data, this.index);
}
