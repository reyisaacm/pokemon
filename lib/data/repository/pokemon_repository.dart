import 'package:pokemon_flutter/data/interface/provider/i_resource_detail_provider.dart';
import 'package:pokemon_flutter/data/interface/provider/i_resource_list_provider.dart';
import 'package:pokemon_flutter/data/interface/repository/i_pokemon_repository.dart';
import 'package:pokemon_flutter/models/enum/resource_type_enum.dart';
import 'package:pokemon_flutter/models/pokemon_list_item_model.dart';
import 'package:pokemon_flutter/models/remote/pokemon/resource_detail_pokemon_response_model.dart';
import 'package:pokemon_flutter/models/remote/resource_list_response_model.dart';
import 'package:pokemon_flutter/models/remote/resource_list_result_response_model.dart';
import 'package:pokemon_flutter/utils/memory_cache.dart';

class PokemonRepository implements IPokemonRepository {
  final IResourceListProvider listProvider;
  final IResourceDetailProvider detailDataProvider;

  PokemonRepository(this.listProvider, this.detailDataProvider);

  Future<ResourceListResponseModel> _getResourceList(
      int limit, int offset, String? search) async {
    final String pokemonListData = await listProvider.getResourceList(
        limit, offset, ResourceTypeEnum.pokemon.name);
    ResourceListResponseModel listData =
        ResourceListResponseModel.fromJson(pokemonListData);

    return listData;
  }

  Future<List<ResourceDetailPokemonResponseModel>> _getResourceDetailList(
      List<ResourceListResultResponseModel> listResource) async {
    final List<ResourceDetailPokemonResponseModel> listPokemonDetail = [];
    final List<Future<String>> listDetailToFetch = [];
    for (final ResourceListResultResponseModel a in listResource) {
      listDetailToFetch.add(detailDataProvider.getResourceDetail(a.url));
    }

    final List<String> listDetail = await Future.wait(listDetailToFetch);

    for (String a in listDetail) {
      // final tmp = jsonDecode(a) as Map<String, dynamic>;
      // print(tmp['name']);
      final ResourceDetailPokemonResponseModel data =
          ResourceDetailPokemonResponseModel.fromJson(a);
      listPokemonDetail.add(data);
    }

    return listPokemonDetail;
  }

  @override
  Future<List<PokemonListItemModel>> getList(int limit, int offset) async {
    try {
      final List<PokemonListItemModel> returnList = [];
      final ResourceListResponseModel listData =
          await _getResourceList(limit, offset, null);
      final List<ResourceListResultResponseModel> listPokemon =
          listData.results;

      final List<ResourceDetailPokemonResponseModel> detailList =
          await _getResourceDetailList(listPokemon);

      for (ResourceDetailPokemonResponseModel a in detailList) {
        returnList.add(PokemonListItemModel(
          id: a.id,
          name: a.name,
          imageUrl: (a.sprites.other?.officialArtwork.frontDefault == null)
              ? ""
              : a.sprites.other!.officialArtwork.frontDefault,
        ));
      }
      return returnList;
    } catch (e) {
      // print(s);
      throw e.toString();
    }
  }

  @override
  Future<List<PokemonListItemModel>> getListAll(
      int limit, int offset, String search) async {
    try {
      //Get total count
      final List<PokemonListItemModel> returnList = [];
      const String cacheKey = "search";
      List<ResourceListResultResponseModel> listPokemon = [];

      final cacheValue =
          localCache.read<List<ResourceListResultResponseModel>>(cacheKey);
      // print("Current cache value pokemon: ${cacheValue}");
      if (cacheValue == null) {
        final ResourceListResponseModel listDataInitial =
            await _getResourceList(limit, offset, null);
        final int count = listDataInitial.count;

        final ResourceListResponseModel listData =
            await _getResourceList(count, offset, null);
        listPokemon = listData.results;

        localCache.create(cacheKey, listPokemon,
            expiry: const Duration(hours: 1));
      } else {
        listPokemon = cacheValue;
      }

      listPokemon = listPokemon
          .where((x) => x.name.toLowerCase().contains(search.toLowerCase()))
          .skip(offset)
          .take(limit)
          .toList();

      final List<ResourceDetailPokemonResponseModel> detailList =
          await _getResourceDetailList(listPokemon);

      for (ResourceDetailPokemonResponseModel a in detailList) {
        returnList.add(PokemonListItemModel(
          id: a.id,
          name: a.name,
          imageUrl: (a.sprites.other?.officialArtwork.frontDefault == null)
              ? ""
              : a.sprites.other!.officialArtwork.frontDefault,
        ));
      }

      return returnList;
    } catch (e) {
      // print(s);
      throw e.toString();
    }
  }
}
