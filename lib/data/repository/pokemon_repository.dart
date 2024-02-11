import 'dart:convert';

import 'package:pokemon_flutter/data/data_provider/pokemon_resource_detail_data_provider.dart';
import 'package:pokemon_flutter/data/data_provider/pokemon_resource_list_data_provider.dart';
import 'package:pokemon_flutter/models/enum/resource_type_enum.dart';
import 'package:pokemon_flutter/models/pokemon_list_item_model.dart';
import 'package:pokemon_flutter/models/pokemon_resource_list_model.dart';
import 'package:pokemon_flutter/models/remote/get_pokemon_resource_list_response_model.dart';

class PokemonRepository {
  final PokemonResourceListDataProvider listProvider;
  final PokemonResourceDetailDataProvider detailDataProvider;

  PokemonRepository(this.listProvider, this.detailDataProvider);

  Future<List<PokemonListItemModel>> getList(int limit, int offset) async {
    try {
      final String pokemonListData = await listProvider.getResourceList(
          limit, offset, ResourceTypeEnum.pokemon.name);
      final jsonDecoded = jsonDecode(pokemonListData);
      final GetPokemonResourceListResponseModel listData =
          GetPokemonResourceListResponseModel.fromMap(jsonDecoded);
      final List<PokemonResourceListModel> listPokemon = listData.results;

      final List<PokemonListItemModel> listPokemonDetail = [];

      for (final PokemonResourceListModel a in listPokemon) {
        final String fetchDetailData =
            await detailDataProvider.getResourceDetail(a.url);
        final PokemonListItemModel data =
            PokemonListItemModel.fromMap(jsonDecode(fetchDetailData));
        listPokemonDetail.add(data);
      }

      return listPokemonDetail;
    } catch (e) {
      // print(s);
      throw e.toString();
    }
  }
}
