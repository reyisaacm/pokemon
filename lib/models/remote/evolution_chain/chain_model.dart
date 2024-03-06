// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:pokemon_flutter/models/remote/evolution_chain/resource_detail_evolution_chain_response_model.dart';
import 'package:pokemon_flutter/models/remote/evolution_chain/species_model.dart';

class ChainResponseModel {
  final List<ChainResponseModel> evolvesTo;
  final bool isBaby;
  final SpeciesResponseModel species;

  ChainResponseModel({
    required this.evolvesTo,
    required this.isBaby,
    required this.species,
  });

  ChainResponseModel copyWith({
    List<ChainResponseModel>? evolvesTo,
    bool? isBaby,
    SpeciesResponseModel? species,
  }) {
    return ChainResponseModel(
      evolvesTo: evolvesTo ?? this.evolvesTo,
      isBaby: isBaby ?? this.isBaby,
      species: species ?? this.species,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'evolvesTo': evolvesTo.map((x) => x.toMap()).toList(),
      'isBaby': isBaby,
      'species': species.toMap(),
    };
  }

  factory ChainResponseModel.fromMap(Map<String, dynamic> map) {
    return ChainResponseModel(
      evolvesTo: List<ChainResponseModel>.from(
        (map['evolvesTo'] as List<int>).map<ChainResponseModel>(
          (x) => ChainResponseModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      isBaby: map['isBaby'] as bool,
      species:
          SpeciesResponseModel.fromMap(map['species'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChainResponseModel.fromJson(String source) =>
      ChainResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ChainModel(evolvesTo: $evolvesTo, isBaby: $isBaby, species: $species)';

  @override
  bool operator ==(covariant ChainResponseModel other) {
    if (identical(this, other)) return true;

    return listEquals(other.evolvesTo, evolvesTo) &&
        other.isBaby == isBaby &&
        other.species == species;
  }

  @override
  int get hashCode => evolvesTo.hashCode ^ isBaby.hashCode ^ species.hashCode;
}
