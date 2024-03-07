// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:pokemon_flutter/models/remote/species/evolution_chain_model.dart';

class ResourceDetailSpeciesResponseModel {
  final int baseHappiness;
  final int captureRate;
  final EvolutionChainResponseModel? evolutionChain;
  final bool formsSwitchable;
  final int genderRate;
  final bool hasGenderDifferences;
  final int hatchCounter;
  final int id;
  final bool isBaby;
  final bool isLegendary;
  final bool isMythical;
  final String name;
  final int order;

  ResourceDetailSpeciesResponseModel({
    required this.baseHappiness,
    required this.captureRate,
    required this.evolutionChain,
    required this.formsSwitchable,
    required this.genderRate,
    required this.hasGenderDifferences,
    required this.hatchCounter,
    required this.id,
    required this.isBaby,
    required this.isLegendary,
    required this.isMythical,
    required this.name,
    required this.order,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'baseHappiness': baseHappiness,
      'captureRate': captureRate,
      'evolutionChain': evolutionChain?.toMap(),
      'formsSwitchable': formsSwitchable,
      'genderRate': genderRate,
      'hasGenderDifferences': hasGenderDifferences,
      'hatchCounter': hatchCounter,
      'id': id,
      'isBaby': isBaby,
      'isLegendary': isLegendary,
      'isMythical': isMythical,
      'name': name,
      'order': order,
    };
  }

  factory ResourceDetailSpeciesResponseModel.fromMap(Map<String, dynamic> map) {
    return ResourceDetailSpeciesResponseModel(
      baseHappiness: map['base_happiness'] as int,
      captureRate: map['capture_rate'] as int,
      evolutionChain: EvolutionChainResponseModel.fromMap(
          map['evolution_chain'] as Map<String, dynamic>),
      formsSwitchable: map['forms_switchable'] as bool,
      genderRate: map['gender_rate'] as int,
      hasGenderDifferences: map['has_gender_differences'] as bool,
      hatchCounter: map['hatch_counter'] as int,
      id: map['id'] as int,
      isBaby: map['is_baby'] as bool,
      isLegendary: map['is_legendary'] as bool,
      isMythical: map['is_mythical'] as bool,
      name: map['name'] as String,
      order: map['order'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResourceDetailSpeciesResponseModel.fromJson(String source) =>
      ResourceDetailSpeciesResponseModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
