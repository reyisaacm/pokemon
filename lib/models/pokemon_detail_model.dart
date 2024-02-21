// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:pokemon_flutter/models/pokemon_species_evolution_chain_model.dart';

class PokemonDetailModel {
  final int id;
  final String name;
  final String imageUrl;
  final int hp;
  final int attack;
  final int defense;
  final int specialAttack;
  final int specialDefense;
  final int speed;
  PokemonSpeciesEvolutionChainModel? evolution;
  int weight;
  String previousBerryType = "";

  PokemonDetailModel(
      {required this.id,
      required this.name,
      required this.imageUrl,
      required this.weight,
      required this.hp,
      required this.attack,
      required this.defense,
      required this.specialAttack,
      required this.specialDefense,
      required this.speed,
      required this.previousBerryType,
      required this.evolution});

  PokemonDetailModel copyWith({
    int? id,
    String? name,
    String? imageUrl,
    int? hp,
    int? attack,
    int? defense,
    int? specialAttack,
    int? specialDefense,
    int? speed,
    int? weight,
    String? previousBerryType,
  }) {
    return PokemonDetailModel(
        id: id ?? this.id,
        name: name ?? this.name,
        imageUrl: imageUrl ?? this.imageUrl,
        weight: weight ?? this.weight,
        hp: hp ?? this.hp,
        attack: attack ?? this.attack,
        defense: defense ?? this.defense,
        specialAttack: specialAttack ?? this.specialAttack,
        specialDefense: specialDefense ?? this.specialDefense,
        speed: speed ?? this.speed,
        previousBerryType: previousBerryType ?? this.previousBerryType,
        evolution: evolution);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'weight': weight,
      'hp': hp,
      'attack': attack,
      'defense': defense,
      'specialAttack': specialAttack,
      'specialDefense': specialDefense,
      'speed': speed,
      'previousBerryType': previousBerryType,
      'evolution': evolution?.toMap()
    };
  }

  factory PokemonDetailModel.fromMap(Map<String, dynamic> map) {
    return PokemonDetailModel(
      id: map['id'] as int,
      name: map['name'] as String,
      imageUrl: (map['sprites']['other']['official-artwork']['front_default'] ??
          map['sprites']['front_default']) as String,
      weight: map['weight'] as int,
      hp: map['stats'][0]['base_stat'] as int,
      attack: map['stats'][1]['base_stat'] as int,
      defense: map['stats'][2]['base_stat'] as int,
      specialAttack: map['stats'][3]['base_stat'] as int,
      specialDefense: map['stats'][4]['base_stat'] as int,
      speed: map['stats'][5]['base_stat'] as int,
      previousBerryType: map['previousBerryType'] ?? "",
      evolution: map['evolution'] != null
          ? PokemonSpeciesEvolutionChainModel.fromMap(
              map['evolution'] as Map<String, dynamic>)
          : null,
    );
  }

  factory PokemonDetailModel.fromStorage(Map<String, dynamic> map) {
    return PokemonDetailModel(
      id: map['id'] as int,
      name: map['name'] as String,
      imageUrl: map['imageUrl'] as String,
      weight: map['weight'] as int,
      hp: map['hp'] as int,
      attack: map['attack'] as int,
      defense: map['defense'] as int,
      specialAttack: map['specialAttack'] as int,
      specialDefense: map['specialDefense'] as int,
      speed: map['speed'] as int,
      previousBerryType: map['previousBerryType'] ?? "",
      evolution: map['evolution'] != null
          ? PokemonSpeciesEvolutionChainModel.fromMap(
              map['evolution'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonDetailModel.fromJson(String source) =>
      PokemonDetailModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PokemonDetailModel(id: $id, name: $name, imageUrl: $imageUrl, weight: $weight, hp: $hp, attack: $attack, defense: $defense, specialAttack: $specialAttack, specialDefense: $specialDefense, speed: $speed)';
  }

  @override
  bool operator ==(covariant PokemonDetailModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.imageUrl == imageUrl &&
        other.weight == weight &&
        other.hp == hp &&
        other.attack == attack &&
        other.defense == defense &&
        other.specialAttack == specialAttack &&
        other.specialDefense == specialDefense &&
        other.speed == speed;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        imageUrl.hashCode ^
        weight.hashCode ^
        hp.hashCode ^
        attack.hashCode ^
        defense.hashCode ^
        specialAttack.hashCode ^
        specialDefense.hashCode ^
        speed.hashCode;
  }
}
