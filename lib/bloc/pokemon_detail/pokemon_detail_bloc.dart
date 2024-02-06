import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pokemon_flutter/models/pokemon_detail_model.dart';

part 'pokemon_detail_event.dart';
part 'pokemon_detail_state.dart';

class PokemonDetailBloc extends Bloc<PokemonDetailEvent, PokemonDetailState> {
  PokemonDetailBloc() : super(PokemonDetailInitial()) {
    on<PokemonDetailEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
