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
        (map['evolves_to'] as List<dynamic>).map<ChainResponseModel>(
          (x) => ChainResponseModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      isBaby: map['is_baby'] as bool,
      species:
          SpeciesResponseModel.fromMap(map['species'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChainResponseModel.fromJson(String source) =>
      ChainResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
