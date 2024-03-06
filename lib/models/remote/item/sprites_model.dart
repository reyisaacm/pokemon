// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SpritesModel {
  final String spritesDefault;

  SpritesModel({
    required this.spritesDefault,
  });

  SpritesModel copyWith({
    String? spritesDefault,
  }) {
    return SpritesModel(
      spritesDefault: spritesDefault ?? this.spritesDefault,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'spritesDefault': spritesDefault,
    };
  }

  factory SpritesModel.fromMap(Map<String, dynamic> map) {
    return SpritesModel(
      spritesDefault: map['spritesDefault'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SpritesModel.fromJson(String source) =>
      SpritesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SpritesModel(spritesDefault: $spritesDefault)';

  @override
  bool operator ==(covariant SpritesModel other) {
    if (identical(this, other)) return true;

    return other.spritesDefault == spritesDefault;
  }

  @override
  int get hashCode => spritesDefault.hashCode;
}
