import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter/foundation.dart";
import 'package:pokemon_flutter/data/interface/repository/i_berry_repository.dart';
import "package:pokemon_flutter/data/repository/pokemon_berry_repository.dart";
import 'package:pokemon_flutter/models/pokemon_berry_model.dart';

part 'pokemon_berry_event.dart';
part 'pokemon_berry_state.dart';

class PokemonBerryBloc extends Bloc<PokemonBerryEvent, PokemonBerryState> {
  final IPokemonBerryRepository repo;

  PokemonBerryBloc(this.repo) : super(PokemonBerryInitial()) {
    on<BerryFetched>(_getBerry);
    on<BerrySelected>(_selectBerry);
  }

  void _getBerry(BerryFetched event, Emitter<PokemonBerryState> emit) async {
    emit(PokemonBerryLoading());
    try {
      final List<PokemonBerryModel> data = await repo.getList();
      emit(PokemonBerrySuccess(data));
    } catch (e) {
      // print(s);
      emit(PokemonBerryFailure(e.toString()));
    }
  }

  void _selectBerry(BerrySelected event, Emitter<PokemonBerryState> emit) {
    List<PokemonBerryModel> currentList = event.data;
    PokemonBerryModel? selectedData;
    for (int i = 0; i < currentList.length; i++) {
      if (i == event.index) {
        currentList[i].isSelected = true;
        selectedData = currentList[i];
      } else {
        currentList[i].isSelected = false;
      }
    }

    emit(PokemonBerrySelect(currentList, selectedData));
  }
}
