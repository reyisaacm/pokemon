import 'package:pokemon_flutter/data/interface/provider/i_resource_detail_provider.dart';
import 'package:pokemon_flutter/data/interface/repository/i_pokemon_detail_repository.dart';
import 'package:pokemon_flutter/models/enum/resource_type_enum.dart';
import 'package:pokemon_flutter/models/pokemon_detail_model.dart';
import 'package:pokemon_flutter/models/pokemon_species_evolution_chain_model.dart';
import 'package:pokemon_flutter/models/remote/evolution_chain/chain_model.dart';
import 'package:pokemon_flutter/models/remote/evolution_chain/resource_detail_evolution_chain_response_model.dart';
import 'package:pokemon_flutter/models/remote/evolution_chain/species_model.dart';
import 'package:pokemon_flutter/models/remote/pokemon/resource_detail_pokemon_response_model.dart';
import 'package:pokemon_flutter/models/remote/species/resource_detail_species_model.dart';

List<int> _getEvolutionSpeciesList(
    List<int> list, ChainResponseModel? chainObj) {
  if (chainObj != null) {
    SpeciesResponseModel? speciesData = chainObj.species;

    final Uri uri = Uri.parse(speciesData.url);
    final int speciesId =
        int.parse(uri.pathSegments[uri.pathSegments.length - 2]);
    list.add(speciesId);
    List<ChainResponseModel> nextEvolutionList = chainObj.evolvesTo;
    ChainResponseModel? nextData =
        (nextEvolutionList.isEmpty) ? null : nextEvolutionList[0];
    return _getEvolutionSpeciesList(list, nextData);
  } else {
    return list;
  }
}

class PokemonDetailRepository implements IPokemonDetailRepository {
  final IResourceDetailProvider detailsDataProvider;

  PokemonDetailRepository(this.detailsDataProvider);

  @override
  Future<PokemonDetailModel> getData(int id) async {
    try {
      PokemonDetailModel data;

      final String fetchDetailData =
          await detailsDataProvider.getResourceDetail(
              "https://pokeapi.co/api/v2/${ResourceTypeEnum.pokemon.name}/$id");
      // final jsonFetchDetailData = jsonDecode(fetchDetailData);
      ResourceDetailPokemonResponseModel responseData =
          ResourceDetailPokemonResponseModel.fromJson(fetchDetailData);

      data = PokemonDetailModel(
          id: id,
          name: responseData.name,
          imageUrl:
              (responseData.sprites.other?.officialArtwork.frontDefault == null)
                  ? ""
                  : responseData.sprites.other!.officialArtwork.frontDefault,
          weight: responseData.weight,
          hp: responseData.stats[0].baseStat,
          attack: responseData.stats[1].baseStat,
          defense: responseData.stats[2].baseStat,
          specialAttack: responseData.stats[3].baseStat,
          specialDefense: responseData.stats[4].baseStat,
          speed: responseData.stats[5].baseStat,
          previousBerryType: "",
          evolution: null);

      final String speciesUrl = responseData.species.url;

      final String fetchSpeciesData =
          await detailsDataProvider.getResourceDetail(speciesUrl);
      final jsonFetchSpeciesData =
          ResourceDetailSpeciesResponseModel.fromJson(fetchSpeciesData);

      final String? evolutionChainUrl =
          jsonFetchSpeciesData.evolutionChain?.url;

      if (evolutionChainUrl != null) {
        final String fetchEvolution =
            await detailsDataProvider.getResourceDetail(evolutionChainUrl);

        ResourceDetailEvolutionChainResponseModel jsonFetchEvolutionData =
            ResourceDetailEvolutionChainResponseModel.fromJson(fetchEvolution);
        final jsonFetchEvolutionObj = jsonFetchEvolutionData.chain;
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
          ResourceDetailPokemonResponseModel jsonFetchEvolutionDetail =
              ResourceDetailPokemonResponseModel.fromJson(
                  fetchEvolutionDetailData);

          PokemonSpeciesEvolutionChainModel pokemonNextEvolution =
              PokemonSpeciesEvolutionChainModel(
                  jsonFetchEvolutionDetail.id, jsonFetchEvolutionDetail.weight);
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
