// ignore_for_file: public_member_api_docs, sort_constructors_first

class PokemonSpeciesEvolutionChainModel {
  final int id;
  final int weight;

  PokemonSpeciesEvolutionChainModel(
    this.id,
    this.weight,
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'weight': weight,
    };
  }

  factory PokemonSpeciesEvolutionChainModel.fromMap(Map<String, dynamic> map) {
    return PokemonSpeciesEvolutionChainModel(
      map['id'] as int,
      map['weight'] as int,
    );
  }
}
