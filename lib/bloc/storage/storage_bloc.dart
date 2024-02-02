import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter/foundation.dart";
import 'package:pokemon_flutter/data/repository/storage_repository.dart';
import "package:pokemon_flutter/models/pokemon_detail_model.dart";

part 'storage_event.dart';
part 'storage_state.dart';

class StorageBloc extends Bloc<StorageEvent, StorageState> {
  final StorageRepository repo;

  StorageBloc(this.repo) : super(StorageInitial()) {
    on<StorageLoaded>(_readData);
    on<StorageWritten>(_writeData);
  }

  void _readData(StorageLoaded event, Emitter<StorageState> emit) async {
    try {
      final PokemonDetailModel data = await repo.getData();
      emit(StorageSuccess(data));
    } catch (e) {
      // print(s);
      emit(StorageFailure(e.toString()));
    }
  }

  void _writeData(StorageWritten event, Emitter<StorageState> emit) async {
    try {
      final PokemonDetailModel data = await repo.writeData(event.data);
      emit(StorageSuccess(data));
    } catch (e) {
      // print(s);
      emit(StorageFailure(e.toString()));
    }
  }
}
