import 'package:pokemon_flutter/models/pokemon_species_evolution_chain_model.dart';

class GetPokemonSpeciesResponseModel {
  final PokemonSpeciesEvolutionChainModel? url;
  final int id;
  final String name;

  GetPokemonSpeciesResponseModel(this.url, this.id, this.name);
}
