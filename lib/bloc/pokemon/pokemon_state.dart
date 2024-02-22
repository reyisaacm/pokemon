part of 'pokemon_bloc.dart';

@immutable
sealed class PokemonState {}

final class PokemonInitial extends PokemonState {}

final class PokemonSuccess extends PokemonState {
  final List<PokemonListItemModel> listPokemonListItemModel;

  PokemonSuccess(this.listPokemonListItemModel);
}

final class PokemonFailure extends PokemonState {
  final String error;

  PokemonFailure(this.error);
}

final class PokemonLoading extends PokemonState {}

final class PokemonSelect extends PokemonState {
  final List<PokemonListItemModel> listPokemonListItemModel;
  final PokemonListItemModel? selectedPokemon;

  PokemonSelect(this.listPokemonListItemModel, this.selectedPokemon);
}

final class PokemonClear extends PokemonState {}
