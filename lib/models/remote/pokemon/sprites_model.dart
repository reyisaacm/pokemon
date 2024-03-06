// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:pokemon_flutter/models/remote/pokemon/other_model.dart';
import 'package:pokemon_flutter/models/remote/pokemon/resource_detail_pokemon_response_model.dart';

class Sprites {
  final String backDefault;
  final dynamic backFemale;
  final String backShiny;
  final dynamic backShinyFemale;
  final String frontDefault;
  final dynamic frontFemale;
  final String frontShiny;
  final dynamic frontShinyFemale;
  final Other? other;
  final Sprites? animated;

  Sprites({
    required this.backDefault,
    required this.backFemale,
    required this.backShiny,
    required this.backShinyFemale,
    required this.frontDefault,
    required this.frontFemale,
    required this.frontShiny,
    required this.frontShinyFemale,
    this.other,
    this.animated,
  });

  Sprites copyWith({
    String? backDefault,
    dynamic? backFemale,
    String? backShiny,
    dynamic? backShinyFemale,
    String? frontDefault,
    dynamic? frontFemale,
    String? frontShiny,
    dynamic? frontShinyFemale,
    Other? other,
    Sprites? animated,
  }) {
    return Sprites(
      backDefault: backDefault ?? this.backDefault,
      backFemale: backFemale ?? this.backFemale,
      backShiny: backShiny ?? this.backShiny,
      backShinyFemale: backShinyFemale ?? this.backShinyFemale,
      frontDefault: frontDefault ?? this.frontDefault,
      frontFemale: frontFemale ?? this.frontFemale,
      frontShiny: frontShiny ?? this.frontShiny,
      frontShinyFemale: frontShinyFemale ?? this.frontShinyFemale,
      other: other ?? this.other,
      animated: animated ?? this.animated,
    );
  }

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
      'animated': animated?.toMap(),
    };
  }

  factory Sprites.fromMap(Map<String, dynamic> map) {
    return Sprites(
      backDefault: map['backDefault'] as String,
      backFemale: map['backFemale'] as dynamic,
      backShiny: map['backShiny'] as String,
      backShinyFemale: map['backShinyFemale'] as dynamic,
      frontDefault: map['frontDefault'] as String,
      frontFemale: map['frontFemale'] as dynamic,
      frontShiny: map['frontShiny'] as String,
      frontShinyFemale: map['frontShinyFemale'] as dynamic,
      other: map['other'] != null
          ? Other.fromMap(map['other'] as Map<String, dynamic>)
          : null,
      animated: map['animated'] != null
          ? Sprites.fromMap(map['animated'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Sprites.fromJson(String source) =>
      Sprites.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Sprites(backDefault: $backDefault, backFemale: $backFemale, backShiny: $backShiny, backShinyFemale: $backShinyFemale, frontDefault: $frontDefault, frontFemale: $frontFemale, frontShiny: $frontShiny, frontShinyFemale: $frontShinyFemale, other: $other, versions: $versions, animated: $animated)';
  }

  @override
  bool operator ==(covariant Sprites other) {
    if (identical(this, other)) return true;

    return other.backDefault == backDefault &&
        other.backFemale == backFemale &&
        other.backShiny == backShiny &&
        other.backShinyFemale == backShinyFemale &&
        other.frontDefault == frontDefault &&
        other.frontFemale == frontFemale &&
        other.frontShiny == frontShiny &&
        other.frontShinyFemale == frontShinyFemale &&
        other.animated == animated;
  }

  @override
  int get hashCode {
    return backDefault.hashCode ^
        backFemale.hashCode ^
        backShiny.hashCode ^
        backShinyFemale.hashCode ^
        frontDefault.hashCode ^
        frontFemale.hashCode ^
        frontShiny.hashCode ^
        frontShinyFemale.hashCode ^
        other.hashCode ^
        animated.hashCode;
  }
}
