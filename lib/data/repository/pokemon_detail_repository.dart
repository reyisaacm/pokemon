import 'dart:convert';

import 'package:pokemon_flutter/data/data_provider/pokemon_resource_detail_data_provider.dart';
import 'package:pokemon_flutter/models/pokemon_detail_model.dart';

class PokemonDetailRepository {
  final PokemonResourceDetailDataProvider detailsDataProvider;

  PokemonDetailRepository(this.detailsDataProvider);

  Future<PokemonDetailModel> getData(int id) async {
    try {
      PokemonDetailModel data;

      final String fetchDetailData = await detailsDataProvider
          .getResourceDetail("https://pokeapi.co/api/v2/pokemon/$id");
      data = PokemonDetailModel.fromMap(jsonDecode(fetchDetailData));

      return data;
    } catch (e) {
      // print(s);
      throw e.toString();
    }
  }
}
