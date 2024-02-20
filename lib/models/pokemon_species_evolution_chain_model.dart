// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PokemonSpeciesEvolutionChainModel {
  final int id;
  final int weight;

  PokemonSpeciesEvolutionChainModel(
    this.id,
    this.weight,
  );

  PokemonSpeciesEvolutionChainModel copyWith({
    int? id,
    int? weight,
  }) {
    return PokemonSpeciesEvolutionChainModel(
      id ?? this.id,
      weight ?? this.weight,
    );
  }

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

  String toJson() => json.encode(toMap());

  factory PokemonSpeciesEvolutionChainModel.fromJson(String source) =>
      PokemonSpeciesEvolutionChainModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'PokemonSpeciesEvolutionChainModel(id: $id, weight: $weight)';

  @override
  bool operator ==(covariant PokemonSpeciesEvolutionChainModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.weight == weight;
  }

  @override
  int get hashCode => id.hashCode ^ weight.hashCode;
}
