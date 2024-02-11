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
    on<StorageFailed>(_failedData);
  }

  void _readData(StorageLoaded event, Emitter<StorageState> emit) async {
    try {
      final PokemonDetailModel? data = await repo.getData();
      if (data != null) {
        emit(StorageSuccess(data));
      } else {
        emit(StorageInitial());
      }
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

  void _failedData(StorageFailed event, Emitter<StorageState> emit) async {
    emit(StorageFailure(event.errorString));
  }
}
