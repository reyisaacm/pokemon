// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:pokemon_flutter/models/remote/pokemon/other_model.dart';

class SpritesResponseModel {
  final String? backDefault;
  final String? backFemale;
  final String? backShiny;
  final String? backShinyFemale;
  final String? frontDefault;
  final String? frontFemale;
  final String? frontShiny;
  final String? frontShinyFemale;
  final OtherResponseModel? other;

  SpritesResponseModel({
    required this.backDefault,
    required this.backFemale,
    required this.backShiny,
    required this.backShinyFemale,
    required this.frontDefault,
    required this.frontFemale,
    required this.frontShiny,
    required this.frontShinyFemale,
    this.other,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'backDefault': backDefault,
      'backFemale': backFemale,
      'backShiny': backShiny,
      'backShinyFemale': backShinyFemale,
      'frontDefault': frontDefault,
      'frontFemale': frontFemale,
      'frontShiny': frontShiny,
      'frontShinyFemale': frontShinyFemale,
      'other': other?.toMap(),
    };
  }

  factory SpritesResponseModel.fromMap(Map<String, dynamic> map) {
    return SpritesResponseModel(
      backDefault: map['back_default'] as String?,
      backFemale: map['back_female'] as String?,
      backShiny: map['back_shiny'] as String?,
      backShinyFemale: map['back_shiny_female'] as String?,
      frontDefault: map['front_default'] as String?,
      frontFemale: map['front_female'] as String?,
      frontShiny: map['front_shiny'] as String?,
      frontShinyFemale: map['front_shiny_female'] as String?,
      other: map['other'] != null
          ? OtherResponseModel.fromMap(map['other'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SpritesResponseModel.fromJson(String source) =>
      SpritesResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
