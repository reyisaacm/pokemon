// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:pokemon_flutter/models/remote/pokemon/species_model.dart';
import 'package:pokemon_flutter/models/remote/pokemon/sprites_model.dart';
import 'package:pokemon_flutter/models/remote/pokemon/stat_model.dart';

class ResourceDetailPokemonResponseModel {
  final int id;
  final String name;
  final SpeciesResponseModel species;
  final SpritesResponseModel sprites;
  final int weight;
  final List<StatResponseModel> stats;
  ResourceDetailPokemonResponseModel({
    required this.id,
    required this.name,
    required this.species,
    required this.sprites,
    required this.weight,
    required this.stats,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'species': species.toMap(),
      'sprites': sprites.toMap(),
      'weight': weight,
      'stats': stats.map((x) => x.toMap()).toList(),
    };
  }

  factory ResourceDetailPokemonResponseModel.fromMap(Map<String, dynamic> map) {
    return ResourceDetailPokemonResponseModel(
      id: map['id'] as int,
      name: map['name'] as String,
      species:
          SpeciesResponseModel.fromMap(map['species'] as Map<String, dynamic>),
      sprites:
          SpritesResponseModel.fromMap(map['sprites'] as Map<String, dynamic>),
      weight: map['weight'] as int,
      stats: List<StatResponseModel>.from(
        (map['stats'] as List<dynamic>).map<StatResponseModel>(
          (x) => StatResponseModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ResourceDetailPokemonResponseModel.fromJson(String source) =>
      ResourceDetailPokemonResponseModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
