import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter/foundation.dart";
import "package:pokemon_flutter/data/repository/storage_repository.dart";
import "package:pokemon_flutter/models/pokemon_detail_model.dart";

part 'startup_event.dart';
part 'startup_state.dart';

class StartupBloc extends Bloc<StartupEvent, StartupState> {
  final StorageRepository repo;

  StartupBloc(this.repo) : super(StartupInitial()) {
    on<StartupLoaded>(_readData);
  }

  void _readData(StartupLoaded event, Emitter<StartupState> emit) async {
    try {
      final PokemonDetailModel? data = await repo.getData();
      if (data != null) {
        emit(StartupSuccess("detail", data.id));
      } else {
        emit(StartupSuccess("home", 0));
      }
    } catch (e) {
      // print(s);
      emit(StartupFailure(e.toString()));
    }
  }
}
