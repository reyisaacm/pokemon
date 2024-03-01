import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon_flutter/data/data_provider/pokemon_resource_detail_data_provider.dart';
import 'package:pokemon_flutter/data/data_provider/pokemon_resource_list_data_provider.dart';
import 'package:pokemon_flutter/data/repository/pokemon_detail_repository.dart';
import 'package:pokemon_flutter/models/pokemon_detail_model.dart';
import 'package:pokemon_flutter/models/pokemon_species_evolution_chain_model.dart';

import '../fixtures.dart';

class MockPokemonDetailResourceDetailDataProvider
    extends PokemonResourceDetailDataProvider {
  @override
  Future<String> getResourceDetail(String resourceName) async {
    if (resourceName.contains("/pokemon/1")) {
      return detailPokemonData;
    } else if (resourceName.contains("/pokemon/2")) {
      return detailPokemonEvolutionData;
    } else if (resourceName.contains("/pokemon-species/")) {
      return detailSpeciesData;
    } else if (resourceName.contains("/evolution-chain/")) {
      return detailEvolutionChainData;
    } else {
      return "";
    }
  }
}

void main() {
  final MockPokemonDetailResourceDetailDataProvider repoDetail =
      MockPokemonDetailResourceDetailDataProvider();
  test(
    "should return correct details",
    () async {
      final repo = PokemonDetailRepository(repoDetail);
      final data = await repo.getData(1);
      final expectedResult = PokemonDetailModel(
          id: 1,
          name: "bulbasaur",
          imageUrl:
              "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png",
          weight: 69,
          hp: 45,
          attack: 49,
          defense: 49,
          specialAttack: 65,
          specialDefense: 65,
          speed: 45,
          previousBerryType: "",
          evolution: PokemonSpeciesEvolutionChainModel(2, 3010));
      final expectedResultEvolution = PokemonSpeciesEvolutionChainModel(2, 130);
      expect(data, expectedResult);
      expect(data.evolution, expectedResultEvolution);
    },
  );
}
