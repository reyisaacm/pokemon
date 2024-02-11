import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter/foundation.dart";
import 'package:pokemon_flutter/data/repository/pokemon_detail_repository.dart';
import 'package:pokemon_flutter/models/pokemon_detail_model.dart';

part 'pokemon_detail_event.dart';
part 'pokemon_detail_state.dart';

class PokemonDetailBloc extends Bloc<PokemonDetailEvent, PokemonDetailState> {
  final PokemonDetailRepository repo;

  PokemonDetailBloc(this.repo) : super(PokemonDetailInitial()) {
    on<PokemonDetailFetched>(_getDetail);
  }

  void _getDetail(
      PokemonDetailFetched event, Emitter<PokemonDetailState> emit) async {
    // emit(PokemonLoading());
    try {
      final PokemonDetailModel data = await repo.getData(event.id);
      emit(PokemonDetailSuccess(data));
    } catch (e) {
      // print(s);
      emit(PokemonDetailFailure(e.toString()));
    }
  }
}
