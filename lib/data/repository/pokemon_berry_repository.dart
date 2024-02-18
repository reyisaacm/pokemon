import 'dart:convert';

import 'package:pokemon_flutter/data/data_provider/pokemon_resource_detail_data_provider.dart';
import 'package:pokemon_flutter/data/data_provider/pokemon_resource_list_data_provider.dart';
import 'package:pokemon_flutter/models/pokemon_berry_model.dart';
import 'package:pokemon_flutter/models/enum/resource_type_enum.dart';
import 'package:pokemon_flutter/models/pokemon_resource_list_model.dart';
import 'package:pokemon_flutter/models/remote/get_pokemon_resource_list_response_model.dart';

class PokemonBerryRepository {
  final PokemonResourceListDataProvider listProvider;
  final PokemonResourceDetailDataProvider detailProvider;

  PokemonBerryRepository(this.listProvider, this.detailProvider);

  int _getFirmnessWeight(String firmness) {
    switch (firmness.toLowerCase()) {
      case 'very-soft':
        return 2;
      case 'soft':
        return 3;
      case 'hard':
        return 5;
      case 'very-hard':
        return 8;
      case 'super-hard':
        return 10;
      default:
        return 1;
    }
  }

  Future<List<PokemonBerryModel>> getList() async {
    try {
      final String listDataCount =
          await listProvider.getResourceList(1, 0, ResourceTypeEnum.berry.name);
      Map<String, dynamic> jsonListDataCount = jsonDecode(listDataCount);
      final int limit = jsonListDataCount['count'];

      final String listData = await listProvider.getResourceList(
          limit, 0, ResourceTypeEnum.berry.name);

      final jsonDecoded = jsonDecode(listData);
      final GetPokemonResourceListResponseModel listResourceData =
          GetPokemonResourceListResponseModel.fromMap(jsonDecoded);
      final List<PokemonResourceListModel> listObj = listResourceData.results;

      final List<PokemonBerryModel> listBerry = [];
      List<Future<String>> listDetailToFetch = [];
      List<Future<String>> listItemToFetch = [];
      List<Map<String, dynamic>> listJsonDetailData = [];

      for (final PokemonResourceListModel a in listObj) {
        listDetailToFetch.add(detailProvider.getResourceDetail(a.url));
      }

      List<String> listDetail = await Future.wait(listDetailToFetch);

      for (final String a in listDetail) {
        Map<String, dynamic> jsonDetailData = jsonDecode(a);
        listJsonDetailData.add(jsonDetailData);
        listItemToFetch.add(
            detailProvider.getResourceDetail(jsonDetailData['item']['url']));
      }

      List<String> listItemDetail = await Future.wait(listItemToFetch);

      for (int i = 0; i < listJsonDetailData.length; i++) {
        final String firmness = listJsonDetailData[i]['firmness']['name'];
        final Map<String, dynamic> jsonItemDetail =
            jsonDecode(listItemDetail[i]);
        listJsonDetailData[i]['imageUrl'] =
            jsonItemDetail['sprites']['default'];
        listJsonDetailData[i]['weight'] = _getFirmnessWeight(firmness);
        final PokemonBerryModel data =
            PokemonBerryModel.fromMap(listJsonDetailData[i]);
        listBerry.add(data);
      }

      return listBerry;
    } catch (e) {
      // print(s);
      throw e.toString();
    }
  }
}
