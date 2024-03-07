// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:pokemon_flutter/models/remote/pokemon/official_artwork_model.dart';
import 'package:pokemon_flutter/models/remote/pokemon/sprites_model.dart';

class OtherResponseModel {
  final OfficialArtworkResponseModel officialArtwork;

  OtherResponseModel({
    required this.officialArtwork,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'officialArtwork': officialArtwork.toMap(),
    };
  }

  factory OtherResponseModel.fromMap(Map<String, dynamic> map) {
    return OtherResponseModel(
      officialArtwork: OfficialArtworkResponseModel.fromMap(
          map['official-artwork'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory OtherResponseModel.fromJson(String source) =>
      OtherResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
