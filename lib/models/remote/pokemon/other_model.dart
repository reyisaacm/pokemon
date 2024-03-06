// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:pokemon_flutter/models/remote/pokemon/official_artwork_model.dart';
import 'package:pokemon_flutter/models/remote/pokemon/sprites_model.dart';

class Other {
  final OfficialArtwork officialArtwork;
  final Sprites showdown;

  Other({
    required this.officialArtwork,
    required this.showdown,
  });

  Other copyWith({
    OfficialArtwork? officialArtwork,
    Sprites? showdown,
  }) {
    return Other(
      officialArtwork: officialArtwork ?? this.officialArtwork,
      showdown: showdown ?? this.showdown,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'officialArtwork': officialArtwork.toMap(),
      'showdown': showdown.toMap(),
    };
  }

  factory Other.fromMap(Map<String, dynamic> map) {
    return Other(
      officialArtwork: OfficialArtwork.fromMap(
          map['officialArtwork'] as Map<String, dynamic>),
      showdown: Sprites.fromMap(map['showdown'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Other.fromJson(String source) =>
      Other.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Other(officialArtwork: $officialArtwork, showdown: $showdown)';

  @override
  bool operator ==(covariant Other other) {
    if (identical(this, other)) return true;

    return other.officialArtwork == officialArtwork &&
        other.showdown == showdown;
  }

  @override
  int get hashCode => officialArtwork.hashCode ^ showdown.hashCode;
}
