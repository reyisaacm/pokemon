// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class OfficialArtworkResponseModel {
  final String frontDefault;
  final String? frontShiny;

  OfficialArtworkResponseModel({
    required this.frontDefault,
    required this.frontShiny,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'frontDefault': frontDefault,
      'frontShiny': frontShiny,
    };
  }

  factory OfficialArtworkResponseModel.fromMap(Map<String, dynamic> map) {
    return OfficialArtworkResponseModel(
      frontDefault: map['front_default'] as String,
      frontShiny: map['front_shiny'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory OfficialArtworkResponseModel.fromJson(String source) =>
      OfficialArtworkResponseModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
