import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter/foundation.dart";
import "package:pokemon_flutter/data/interface/repository/i_storage_repository.dart";
import 'package:pokemon_flutter/data/repository/storage_repository.dart';
import "package:pokemon_flutter/models/pokemon_detail_model.dart";

part 'storage_event.dart';
part 'storage_state.dart';

class StorageBloc extends Bloc<StorageEvent, StorageState> {
  final IStorageRepository repo;

  StorageBloc(this.repo) : super(StorageInitial()) {
    on<StorageLoaded>(_readData);
    on<StorageWritten>(_writeData);
    on<StorageFailed>(_failedData);
    on<StorageWeightUpdated>(_updateWeightData);
    on<StorageDeleted>(_clearData);
  }

  void _readData(StorageLoaded event, Emitter<StorageState> emit) async {
    try {
      final PokemonDetailModel? data = await repo.getData();
      if (data != null) {
        emit(StorageSuccess(data));
      } else {
        emit(StorageEmpty());
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

  void _updateWeightData(
      StorageWeightUpdated event, Emitter<StorageState> emit) async {
    try {
      final PokemonDetailModel? data = await repo.getData();
      if (data != null) {
        if (event.berryType == data.previousBerryType) {
          data.weight = data.weight - (event.weight * 2);
          if (data.weight < 1) {
            data.weight = 1;
          }
        } else {
          data.weight = data.weight + event.weight;
        }
        data.previousBerryType = event.berryType;
        final PokemonDetailModel updatedData = await repo.writeData(data);
        emit(StorageSuccess(updatedData));
      } else {
        emit(StorageFailure("Internal server error"));
      }
    } catch (e) {
      // print(s);
      emit(StorageFailure(e.toString()));
    }
  }

  void _clearData(StorageDeleted event, Emitter<StorageState> emit) async {
    try {
      await repo.clearData();
      emit(StorageInitial());
    } catch (e) {
      emit(StorageFailure(e.toString()));
    }
  }
}
