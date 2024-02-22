import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter/foundation.dart";
import "package:pokemon_flutter/data/repository/pokemon_repository.dart";
import 'package:pokemon_flutter/models/pokemon_list_item_model.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final PokemonRepository pokemonRepository;

  PokemonBloc(this.pokemonRepository) : super(PokemonInitial()) {
    on<PokemonFetched>(_getPokemonList);
    on<PokemonSelected>(_selectPokemonList);
    on<PokemonCleared>(_clearPokemonList);
  }

  void _getPokemonList(PokemonFetched event, Emitter<PokemonState> emit) async {
    emit(PokemonLoading());
    try {
      if (event.search == null || event.search!.trim() == "") {
        final List<PokemonListItemModel> data =
            await pokemonRepository.getList(event.limit, event.offset);
        emit(PokemonSuccess(data));
      } else {
        final List<PokemonListItemModel> data = await pokemonRepository
            .getListAll(event.limit, event.offset, event.search!);
        emit(PokemonSuccess(data));
      }
    } catch (e) {
      // print(s);
      emit(PokemonFailure(e.toString()));
    }
  }

  void _selectPokemonList(PokemonSelected event, Emitter<PokemonState> emit) {
    List<PokemonListItemModel> currentList = event.data;
    PokemonListItemModel? selectedPokemon;
    for (int i = 0; i < currentList.length; i++) {
      if (i == event.index) {
        currentList[i].isSelected = true;
        selectedPokemon = currentList[i];
      } else {
        currentList[i].isSelected = false;
      }
    }

    emit(PokemonSelect(currentList, selectedPokemon));
  }

  void _clearPokemonList(PokemonCleared event, Emitter<PokemonState> emit) {
    emit(PokemonClear());
  }
}
