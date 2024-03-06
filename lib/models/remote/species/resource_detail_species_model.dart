// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:pokemon_flutter/models/remote/species/evolution_chain_model.dart';

class ResourceDetailSpeciesResponseModel {
  final int baseHappiness;
  final int captureRate;
  final EvolutionChainModel? evolutionChain;
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

  ResourceDetailSpeciesResponseModel copyWith({
    int? baseHappiness,
    int? captureRate,
    EvolutionChainModel? evolutionChain,
    bool? formsSwitchable,
    int? genderRate,
    bool? hasGenderDifferences,
    int? hatchCounter,
    int? id,
    bool? isBaby,
    bool? isLegendary,
    bool? isMythical,
    String? name,
    int? order,
  }) {
    return ResourceDetailSpeciesResponseModel(
      baseHappiness: baseHappiness ?? this.baseHappiness,
      captureRate: captureRate ?? this.captureRate,
      evolutionChain: evolutionChain ?? this.evolutionChain,
      formsSwitchable: formsSwitchable ?? this.formsSwitchable,
      genderRate: genderRate ?? this.genderRate,
      hasGenderDifferences: hasGenderDifferences ?? this.hasGenderDifferences,
      hatchCounter: hatchCounter ?? this.hatchCounter,
      id: id ?? this.id,
      isBaby: isBaby ?? this.isBaby,
      isLegendary: isLegendary ?? this.isLegendary,
      isMythical: isMythical ?? this.isMythical,
      name: name ?? this.name,
      order: order ?? this.order,
    );
  }

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
      baseHappiness: map['baseHappiness'] as int,
      captureRate: map['captureRate'] as int,
      evolutionChain: EvolutionChainModel.fromMap(
          map['evolutionChain'] as Map<String, dynamic>),
      formsSwitchable: map['formsSwitchable'] as bool,
      genderRate: map['genderRate'] as int,
      hasGenderDifferences: map['hasGenderDifferences'] as bool,
      hatchCounter: map['hatchCounter'] as int,
      id: map['id'] as int,
      isBaby: map['isBaby'] as bool,
      isLegendary: map['isLegendary'] as bool,
      isMythical: map['isMythical'] as bool,
      name: map['name'] as String,
      order: map['order'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResourceDetailSpeciesResponseModel.fromJson(String source) =>
      ResourceDetailSpeciesResponseModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ResourceDetailSpeciesResponseModel(baseHappiness: $baseHappiness, captureRate: $captureRate, evolutionChain: $evolutionChain, formsSwitchable: $formsSwitchable, genderRate: $genderRate, hasGenderDifferences: $hasGenderDifferences, hatchCounter: $hatchCounter, id: $id, isBaby: $isBaby, isLegendary: $isLegendary, isMythical: $isMythical, name: $name, order: $order)';
  }

  @override
  bool operator ==(covariant ResourceDetailSpeciesResponseModel other) {
    if (identical(this, other)) return true;

    return other.baseHappiness == baseHappiness &&
        other.captureRate == captureRate &&
        other.evolutionChain == evolutionChain &&
        other.formsSwitchable == formsSwitchable &&
        other.genderRate == genderRate &&
        other.hasGenderDifferences == hasGenderDifferences &&
        other.hatchCounter == hatchCounter &&
        other.id == id &&
        other.isBaby == isBaby &&
        other.isLegendary == isLegendary &&
        other.isMythical == isMythical &&
        other.name == name &&
        other.order == order;
  }

  @override
  int get hashCode {
    return baseHappiness.hashCode ^
        captureRate.hashCode ^
        evolutionChain.hashCode ^
        formsSwitchable.hashCode ^
        genderRate.hashCode ^
        hasGenderDifferences.hashCode ^
        hatchCounter.hashCode ^
        id.hashCode ^
        isBaby.hashCode ^
        isLegendary.hashCode ^
        isMythical.hashCode ^
        name.hashCode ^
        order.hashCode;
  }
}
