part of 'pokemon_bloc.dart';

@immutable
sealed class PokemonState {}

final class PokemonInitial extends PokemonState {}

final class PokemonSuccess extends PokemonState {
  final List<PokemonDetailModel> listPokemonDetailModel;

  PokemonSuccess(this.listPokemonDetailModel);
}

final class PokemonFailure extends PokemonState {
  final String error;

  PokemonFailure(this.error);
}

final class PokemonLoading extends PokemonState {}

final class PokemonSelect extends PokemonState {
  final List<PokemonDetailModel> listPokemonDetailModel;
  final PokemonDetailModel? selectedPokemon;

  PokemonSelect(this.listPokemonDetailModel, this.selectedPokemon);
}
