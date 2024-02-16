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

  Future<List<PokemonBerryModel>> getList() async {
    try {
      final String listData = await listProvider.getResourceList(
          100, 0, ResourceTypeEnum.berry.name);
      final jsonDecoded = jsonDecode(listData);
      final GetPokemonResourceListResponseModel listResourceData =
          GetPokemonResourceListResponseModel.fromMap(jsonDecoded);
      final List<PokemonResourceListModel> listObj = listResourceData.results;

      final List<PokemonBerryModel> listBerry = [];

      for (final PokemonResourceListModel a in listObj) {
        final String fetchDetailData =
            await detailProvider.getResourceDetail(a.url);
        final PokemonBerryModel data =
            PokemonBerryModel.fromMap(jsonDecode(fetchDetailData));
        listBerry.add(data);
      }

      return listBerry;
    } catch (e) {
      // print(s);
      throw e.toString();
    }
  }
}
