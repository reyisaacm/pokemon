import 'dart:convert';

import 'package:pokemon_flutter/data/data_provider/pokemon_resource_detail_data_provider.dart';
import 'package:pokemon_flutter/data/data_provider/pokemon_resource_list_data_provider.dart';
import 'package:pokemon_flutter/models/enum/resource_type_enum.dart';
import 'package:pokemon_flutter/models/pokemon_list_item_model.dart';
import 'package:pokemon_flutter/models/pokemon_resource_list_model.dart';
import 'package:pokemon_flutter/models/remote/resource_list_response_model.dart';

class PokemonRepository {
  final PokemonResourceListDataProvider listProvider;
  final PokemonResourceDetailDataProvider detailDataProvider;

  PokemonRepository(this.listProvider, this.detailDataProvider);

  Future<ResourceListResponseModel> _getResourceList(
      int limit, int offset, String? search) async {
    final String pokemonListData = await listProvider.getResourceList(
        limit, offset, ResourceTypeEnum.pokemon.name);
    final jsonDecoded = jsonDecode(pokemonListData);
    final ResourceListResponseModel listData =
        ResourceListResponseModel.fromMap(jsonDecoded);

    return listData;
  }

  Future<List<PokemonListItemModel>> _getResourceDetailList(
      List<PokemonResourceListModel> listResource) async {
    final List<PokemonListItemModel> listPokemonDetail = [];
    final List<Future<String>> listDetailToFetch = [];
    for (final PokemonResourceListModel a in listResource) {
      listDetailToFetch.add(detailDataProvider.getResourceDetail(a.url));
    }

    final List<String> listDetail = await Future.wait(listDetailToFetch);
    for (String a in listDetail) {
      final PokemonListItemModel data =
          PokemonListItemModel.fromMap(jsonDecode(a));
      listPokemonDetail.add(data);
    }

    return listPokemonDetail;
  }

  Future<List<PokemonListItemModel>> getList(int limit, int offset) async {
    try {
      final ResourceListResponseModel listData =
          await _getResourceList(limit, offset, null);
      final List<PokemonResourceListModel> listPokemon = listData.results;

      final List<PokemonListItemModel> returnList =
          await _getResourceDetailList(listPokemon);
      return returnList;
    } catch (e) {
      // print(s);
      throw e.toString();
    }
  }

  Future<List<PokemonListItemModel>> getListAll(
      int limit, int offset, String search) async {
    try {
      //Get total count
      final ResourceListResponseModel listDataInitial =
          await _getResourceList(limit, offset, null);
      final int count = listDataInitial.count;

      final ResourceListResponseModel listData =
          await _getResourceList(count, offset, null);
      List<PokemonResourceListModel> listPokemon = listData.results;

      listPokemon = listData.results
          .where((x) => x.name.toLowerCase().contains(search.toLowerCase()))
          .skip(offset)
          .take(limit)
          .toList();

      final List<PokemonListItemModel> returnList =
          await _getResourceDetailList(listPokemon);

      return returnList;
    } catch (e) {
      // print(s);
      throw e.toString();
    }
  }
}
