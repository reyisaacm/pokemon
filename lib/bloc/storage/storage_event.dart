part of 'storage_bloc.dart';

@immutable
sealed class StorageEvent {}

final class StorageLoaded extends StorageEvent {}

final class StorageWritten extends StorageEvent {
  final PokemonDetailModel data;
  StorageWritten(this.data);
}

final class StorageFailed extends StorageEvent {
  final String errorString;
  StorageFailed(this.errorString);
}

final class StorageWeightUpdated extends StorageEvent {
  final int weight;
  final String berryType;
  StorageWeightUpdated(this.weight, this.berryType);
}

final class StorageDeleted extends StorageEvent {}
