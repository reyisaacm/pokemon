import 'dart:convert';

import 'package:pokemon_flutter/data/data_provider/pokemon_resource_detail_data_provider.dart';
import 'package:pokemon_flutter/models/enum/resource_type_enum.dart';
import 'package:pokemon_flutter/models/pokemon_detail_model.dart';
import 'package:pokemon_flutter/models/pokemon_species_evolution_chain_model.dart';

List<int> _getEvolutionSpeciesList(
    List<int> list, Map<String, dynamic>? chainObj) {
  if (chainObj != null) {
    Map<String, dynamic>? speciesData = chainObj['species'];

    final Uri uri = Uri.parse(speciesData!['url']);
    final int speciesId =
        int.parse(uri.pathSegments[uri.pathSegments.length - 2]);
    list.add(speciesId);
    List<dynamic> nextEvolutionList = chainObj['evolves_to'];
    Map<String, dynamic>? nextData =
        (nextEvolutionList.isEmpty) ? null : nextEvolutionList[0];
    return _getEvolutionSpeciesList(list, nextData);
  } else {
    return list;
  }
}

class PokemonDetailRepository {
  final PokemonResourceDetailDataProvider detailsDataProvider;

  PokemonDetailRepository(this.detailsDataProvider);

  Future<PokemonDetailModel> getData(int id) async {
    try {
      PokemonDetailModel data;

      final String fetchDetailData =
          await detailsDataProvider.getResourceDetail(
              "https://pokeapi.co/api/v2/${ResourceTypeEnum.pokemon.name}/$id");
      final jsonFetchDetailData = jsonDecode(fetchDetailData);
      data = PokemonDetailModel.fromMap(jsonFetchDetailData);

      final String speciesUrl = jsonFetchDetailData['species']['url'];

      final String fetchSpeciesData =
          await detailsDataProvider.getResourceDetail(speciesUrl);
      final jsonFetchSpeciesData = jsonDecode(fetchSpeciesData);

      final String? evolutionChainUrl =
          jsonFetchSpeciesData['evolution_chain']?['url'];

      if (evolutionChainUrl != null) {
        final String fetchEvolution =
            await detailsDataProvider.getResourceDetail(evolutionChainUrl);

        final jsonFetchEvolutionData = jsonDecode(fetchEvolution);
        final jsonFetchEvolutionObj = jsonFetchEvolutionData['chain'];
        List<int> evolutionData =
            _getEvolutionSpeciesList([], jsonFetchEvolutionObj);
        int evolutionDataLength = evolutionData.length;
        int? nextEvolutionId;
        if (evolutionDataLength > 0) {
          //pokemon has evolution
          int initialIndex = evolutionData.indexWhere((x) => x == id);
          if (initialIndex < evolutionData.length - 1) {
            //get the next evolution
            nextEvolutionId = evolutionData[initialIndex + 1];
          }
        }
        if (nextEvolutionId != null) {
          final String fetchEvolutionDetailData =
              await detailsDataProvider.getResourceDetail(
                  "https://pokeapi.co/api/v2/${ResourceTypeEnum.pokemon.name}/$nextEvolutionId");
          final jsonFetchEvolutionDetail = jsonDecode(fetchEvolutionDetailData);
          final PokemonDetailModel evolutionPokemonData =
              PokemonDetailModel.fromMap(jsonFetchEvolutionDetail);
          PokemonSpeciesEvolutionChainModel pokemonNextEvolution =
              PokemonSpeciesEvolutionChainModel(
                  evolutionPokemonData.id, evolutionPokemonData.weight);
          data.evolution = pokemonNextEvolution;
        }
      }

      return data;
    } catch (e) {
      // print(s);
      throw e.toString();
    }
  }
}
