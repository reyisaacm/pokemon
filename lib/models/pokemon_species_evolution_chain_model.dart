// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PokemonSpeciesEvolutionChainModel {
  final String? url;

  PokemonSpeciesEvolutionChainModel(
    this.url,
  );

  PokemonSpeciesEvolutionChainModel copyWith({
    String? url,
  }) {
    return PokemonSpeciesEvolutionChainModel(
      url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'url': url,
    };
  }

  factory PokemonSpeciesEvolutionChainModel.fromMap(Map<String, dynamic> map) {
    return PokemonSpeciesEvolutionChainModel(
      map['url'] != null ? map['url'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonSpeciesEvolutionChainModel.fromJson(String source) =>
      PokemonSpeciesEvolutionChainModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PokemonSpeciesEvolutionChainModel(url: $url)';

  @override
  bool operator ==(covariant PokemonSpeciesEvolutionChainModel other) {
    if (identical(this, other)) return true;

    return other.url == url;
  }

  @override
  int get hashCode => url.hashCode;
}
