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

final class PokemonChooseButtonEnable extends PokemonState {}

final class PokemonLoading extends PokemonState {}
