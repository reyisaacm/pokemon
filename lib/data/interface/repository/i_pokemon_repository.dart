import 'package:pokemon_flutter/models/pokemon_list_item_model.dart';

abstract interface class IPokemonRepository {
  Future<List<PokemonListItemModel>> getList(int limit, int offset);
  Future<List<PokemonListItemModel>> getListAll(
      int limit, int offset, String search);
}
