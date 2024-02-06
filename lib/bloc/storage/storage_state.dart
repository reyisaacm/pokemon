part of 'storage_bloc.dart';

@immutable
sealed class StorageState {}

final class StorageInitial extends StorageState {}

final class StorageSuccess extends StorageState {
  final PokemonListItemModel data;
  StorageSuccess(this.data);
}

final class StorageFailure extends StorageState {
  final String error;
  StorageFailure(this.error);
}
