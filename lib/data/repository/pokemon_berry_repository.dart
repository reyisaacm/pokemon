import 'dart:convert';

import 'package:pokemon_flutter/data/data_provider/pokemon_berry_data_provider.dart';
import 'package:pokemon_flutter/data/data_provider/pokemon_details_data_provider.dart';
import 'package:pokemon_flutter/models/pokemon_list_item_model.dart';
import 'package:pokemon_flutter/models/pokemon_model.dart';
import 'package:pokemon_flutter/models/remote/get_pokemon_response_model.dart';

class PokemonBerryRepository {
  final PokemonBerryDataProvider pokemonBerryDataProvider;
  final PokemonDetailsDataProvider pokemonDetailDataProvider;

  PokemonBerryRepository(
      this.pokemonBerryDataProvider, this.pokemonDetailDataProvider);

  Future<List<PokemonListItemModel>> getList(int limit, int offset) async {
    try {
      final String pokemonListData =
          await pokemonBerryDataProvider.getPokemonList(limit, offset);
      final jsonDecoded = jsonDecode(pokemonListData);
      final GetPokemonResponseModel listData =
          GetPokemonResponseModel.fromMap(jsonDecoded);
      final List<PokemonModel> listPokemon = listData.results;

      final List<PokemonListItemModel> listPokemonDetail = [];

      for (final PokemonModel a in listPokemon) {
        final String fetchDetailData =
            await pokemonDetailDataProvider.getPokemonDetail(a.url);
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
