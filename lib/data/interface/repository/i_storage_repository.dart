import 'package:pokemon_flutter/models/pokemon_detail_model.dart';

abstract interface class IStorageRepository {
  Future<PokemonDetailModel?> getData();
  Future<PokemonDetailModel> writeData(PokemonDetailModel data);
  Future<void> clearData();
}
