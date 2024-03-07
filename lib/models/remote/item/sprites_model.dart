// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SpritesResponseModel {
  final String spritesDefault;

  SpritesResponseModel({
    required this.spritesDefault,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'spritesDefault': spritesDefault,
    };
  }

  factory SpritesResponseModel.fromMap(Map<String, dynamic> map) {
    return SpritesResponseModel(
      spritesDefault: map['default'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SpritesResponseModel.fromJson(String source) =>
      SpritesResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
