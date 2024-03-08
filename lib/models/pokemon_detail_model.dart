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
}
