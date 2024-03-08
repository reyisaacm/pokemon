import 'package:pokemon_flutter/models/pokemon_berry_model.dart';

abstract interface class IPokemonBerryRepository {
  Future<List<PokemonBerryModel>> getList();
}
