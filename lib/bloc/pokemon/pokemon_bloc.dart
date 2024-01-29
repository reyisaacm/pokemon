import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter/foundation.dart";
import "package:pokemon_flutter/data/repository/pokemon_repository.dart";
import "package:pokemon_flutter/models/pokemon_detail_model.dart";

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final PokemonRepository pokemonRepository;

  PokemonBloc(this.pokemonRepository) : super(PokemonInitial()) {
    on<PokemonFetched>(_getPokemonList);
  }

  void _getPokemonList(PokemonFetched event, Emitter<PokemonState> emit) async {
    emit(PokemonLoading());
    try {
      final List<PokemonDetailModel> data =
          await pokemonRepository.getList(1, 0);
      emit(PokemonSuccess(data));
    } catch (e) {
      // print(s);
      emit(PokemonFailure(e.toString()));
    }
  }
}
