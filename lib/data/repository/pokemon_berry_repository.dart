import 'dart:convert';

import 'package:pokemon_flutter/data/data_provider/pokemon_resource_details_data_provider.dart';
import 'package:pokemon_flutter/data/data_provider/pokemon_resource_list_data_provider.dart';
import 'package:pokemon_flutter/models/berry_model.dart';
import 'package:pokemon_flutter/models/pokemon_list_item_model.dart';
import 'package:pokemon_flutter/models/pokemon_resource_list_model.dart';
import 'package:pokemon_flutter/models/remote/get_pokemon_resource_list_response_model.dart';

class PokemonBerryRepository {
  final PokemonResourceListDataProvider listDataProvider;
  final PokemonResourceDetailsDataProvider detailDataProvider;

  PokemonBerryRepository(this.listDataProvider, this.detailDataProvider);

  Future<List<BerryModel>> getList(int limit, int offset) async {
    try {
      List<BerryModel> model = List.empty();

      return model;
    } catch (e) {
      // print(s);
      throw e.toString();
    }
  }
}
