// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class OfficialArtwork {
  final String frontDefault;
  final String frontShiny;

  OfficialArtwork({
    required this.frontDefault,
    required this.frontShiny,
  });

  OfficialArtwork copyWith({
    String? frontDefault,
    String? frontShiny,
  }) {
    return OfficialArtwork(
      frontDefault: frontDefault ?? this.frontDefault,
      frontShiny: frontShiny ?? this.frontShiny,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'frontDefault': frontDefault,
      'frontShiny': frontShiny,
    };
  }

  factory OfficialArtwork.fromMap(Map<String, dynamic> map) {
    return OfficialArtwork(
      frontDefault: map['frontDefault'] as String,
      frontShiny: map['frontShiny'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory OfficialArtwork.fromJson(String source) =>
      OfficialArtwork.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'OfficialArtwork(frontDefault: $frontDefault, frontShiny: $frontShiny)';

  @override
  bool operator ==(covariant OfficialArtwork other) {
    if (identical(this, other)) return true;

    return other.frontDefault == frontDefault && other.frontShiny == frontShiny;
  }

  @override
  int get hashCode => frontDefault.hashCode ^ frontShiny.hashCode;
}
