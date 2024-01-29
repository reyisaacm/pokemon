import 'dart:convert';

import 'package:pokemon_flutter/data/data_provider/pokemon_data_provider.dart';
import 'package:pokemon_flutter/data/data_provider/pokemon_details_data_provider.dart';
import 'package:pokemon_flutter/models/pokemon_detail_model.dart';
import 'package:pokemon_flutter/models/pokemon_model.dart';
import 'package:pokemon_flutter/models/remote/get_pokemon_response_model.dart';

class PokemonRepository {
  final PokemonDataProvider pokemonDataProvider;
  final PokemonDetailsDataProvider pokemonDetailDataProvider;

  PokemonRepository(this.pokemonDataProvider, this.pokemonDetailDataProvider);

  Future<List<PokemonDetailModel>> getList(int limit, int offset) async {
    try {
      final String pokemonListData =
          await pokemonDataProvider.getPokemonList(limit, offset);
      final GetPokemonResponseModel listData =
          GetPokemonResponseModel.fromMap(jsonDecode(pokemonListData));
      final List<PokemonModel> listPokemon = listData.results;

      final List<PokemonDetailModel> listPokemonDetail = [];

      for (final PokemonModel a in listPokemon) {
        final String fetchDetailData =
            await pokemonDetailDataProvider.getPokemonDetail(a.id);
        final PokemonDetailModel data =
            PokemonDetailModel.fromMap(jsonDecode(fetchDetailData));
        listPokemonDetail.add(data);
      }

      return listPokemonDetail;
    } catch (e) {
      // print(s);
      throw e.toString();
    }
  }
}
