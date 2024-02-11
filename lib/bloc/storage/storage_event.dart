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

final class StorageDeleted extends StorageEvent {}
