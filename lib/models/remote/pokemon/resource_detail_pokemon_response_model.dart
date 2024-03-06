// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:pokemon_flutter/models/remote/pokemon/species_model.dart';
import 'package:pokemon_flutter/models/remote/pokemon/sprites_model.dart';
import 'package:pokemon_flutter/models/remote/pokemon/stat_model.dart';

class ResourceDetailPokemonResponseModel {
  final int baseExperience;
  final List<Species> forms;
  final int height;
  final int id;
  final bool isDefault;
  final String locationAreaEncounters;
  final String name;
  final int order;
  final Species species;
  final Sprites sprites;
  final int weight;
  final List<Stat> stats;
  ResourceDetailPokemonResponseModel({
    required this.baseExperience,
    required this.forms,
    required this.height,
    required this.id,
    required this.isDefault,
    required this.locationAreaEncounters,
    required this.name,
    required this.order,
    required this.species,
    required this.sprites,
    required this.weight,
    required this.stats,
  });

  ResourceDetailPokemonResponseModel copyWith({
    int? baseExperience,
    List<Species>? forms,
    int? height,
    int? id,
    bool? isDefault,
    String? locationAreaEncounters,
    String? name,
    int? order,
    Species? species,
    Sprites? sprites,
    int? weight,
    List<Stat>? stats,
  }) {
    return ResourceDetailPokemonResponseModel(
      baseExperience: baseExperience ?? this.baseExperience,
      forms: forms ?? this.forms,
      height: height ?? this.height,
      id: id ?? this.id,
      isDefault: isDefault ?? this.isDefault,
      locationAreaEncounters:
          locationAreaEncounters ?? this.locationAreaEncounters,
      name: name ?? this.name,
      order: order ?? this.order,
      species: species ?? this.species,
      sprites: sprites ?? this.sprites,
      weight: weight ?? this.weight,
      stats: stats ?? this.stats,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'baseExperience': baseExperience,
      'forms': forms.map((x) => x.toMap()).toList(),
      'height': height,
      'id': id,
      'isDefault': isDefault,
      'locationAreaEncounters': locationAreaEncounters,
      'name': name,
      'order': order,
      'species': species.toMap(),
      'sprites': sprites.toMap(),
      'weight': weight,
      'stats': stats.map((x) => x.toMap()).toList(),
    };
  }

  factory ResourceDetailPokemonResponseModel.fromMap(Map<String, dynamic> map) {
    return ResourceDetailPokemonResponseModel(
      baseExperience: map['baseExperience'] as int,
      forms: List<Species>.from(
        (map['forms'] as List<int>).map<Species>(
          (x) => Species.fromMap(x as Map<String, dynamic>),
        ),
      ),
      height: map['height'] as int,
      id: map['id'] as int,
      isDefault: map['isDefault'] as bool,
      locationAreaEncounters: map['locationAreaEncounters'] as String,
      name: map['name'] as String,
      order: map['order'] as int,
      species: Species.fromMap(map['species'] as Map<String, dynamic>),
      sprites: Sprites.fromMap(map['sprites'] as Map<String, dynamic>),
      weight: map['weight'] as int,
      stats: List<Stat>.from(
        (map['stats'] as List<int>).map<Stat>(
          (x) => Stat.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ResourceDetailPokemonResponseModel.fromJson(String source) =>
      ResourceDetailPokemonResponseModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ResourceDetailPokemonResponseModel(baseExperience: $baseExperience, forms: $forms, height: $height, id: $id, isDefault: $isDefault, locationAreaEncounters: $locationAreaEncounters, name: $name, order: $order, species: $species, sprites: $sprites, weight: $weight, stats: $stats)';
  }

  @override
  bool operator ==(covariant ResourceDetailPokemonResponseModel other) {
    if (identical(this, other)) return true;

    return other.baseExperience == baseExperience &&
        listEquals(other.forms, forms) &&
        other.height == height &&
        other.id == id &&
        other.isDefault == isDefault &&
        other.locationAreaEncounters == locationAreaEncounters &&
        other.name == name &&
        other.order == order &&
        other.species == species &&
        other.sprites == sprites &&
        other.weight == weight &&
        listEquals(other.stats, stats);
  }

  @override
  int get hashCode {
    return baseExperience.hashCode ^
        forms.hashCode ^
        height.hashCode ^
        id.hashCode ^
        isDefault.hashCode ^
        locationAreaEncounters.hashCode ^
        name.hashCode ^
        order.hashCode ^
        species.hashCode ^
        sprites.hashCode ^
        weight.hashCode ^
        stats.hashCode;
  }
}
