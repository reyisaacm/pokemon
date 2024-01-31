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
    on<PokemonSelected>(_selectPokemonList);
  }

  void _getPokemonList(PokemonFetched event, Emitter<PokemonState> emit) async {
    emit(PokemonLoading());
    try {
      final List<PokemonDetailModel> data =
          await pokemonRepository.getList(event.limit, event.offset);
      emit(PokemonSuccess(data));
    } catch (e) {
      // print(s);
      emit(PokemonFailure(e.toString()));
    }
  }

  void _selectPokemonList(PokemonSelected event, Emitter<PokemonState> emit) {
    PokemonSuccess state = this.state as PokemonSuccess;

    // for (int i = 0; i < state.listPokemonDetailModel.length; i++) {
    //   // print(event.index);
    //   // print(i);
    //   if (i == event.index) {
    //     // print("selected");
    //     state.listPokemonDetailModel[event.index].isSelected = true;
    //   } else {
    //     state.listPokemonDetailModel[event.index].isSelected = false;
    //   }
    // }

    state.listPokemonDetailModel[event.index].isSelected = true;

    emit(PokemonSuccess([...state.listPokemonDetailModel]));
  }
}
