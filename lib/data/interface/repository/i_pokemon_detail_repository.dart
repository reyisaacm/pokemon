import 'package:pokemon_flutter/models/pokemon_detail_model.dart';

abstract interface class IPokemonDetailRepository {
  Future<PokemonDetailModel> getData(int id);
}
