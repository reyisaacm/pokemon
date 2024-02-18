// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PokemonBerryModel {
  int id;
  String firmness;
  String name;
  String imageUrl;
  int weight;
  bool isSelected = false;
  PokemonBerryModel({
    required this.id,
    required this.firmness,
    required this.name,
    required this.imageUrl,
    required this.weight,
  });

  PokemonBerryModel copyWith({
    int? id,
    String? firmness,
    String? name,
    String? imageUrl,
    int? weight,
  }) {
    return PokemonBerryModel(
      id: id ?? this.id,
      firmness: firmness ?? this.firmness,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      weight: weight ?? this.weight,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'firmness': firmness,
      'name': name,
      'imageUrl': imageUrl,
      'weight': weight,
    };
  }

  factory PokemonBerryModel.fromMap(Map<String, dynamic> map) {
    return PokemonBerryModel(
      id: map['id'] as int,
      firmness: map['firmness']['name'] as String,
      name: map['item']['name'] as String,
      imageUrl: map['imageUrl'] as String,
      weight: map['weight'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonBerryModel.fromJson(String source) =>
      PokemonBerryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PokemonBerryModel(id: $id, firmness: $firmness, name: $name, imageUrl: $imageUrl, weight: $weight)';
  }

  @override
  bool operator ==(covariant PokemonBerryModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.firmness == firmness &&
        other.name == name &&
        other.imageUrl == imageUrl &&
        other.weight == weight;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        firmness.hashCode ^
        name.hashCode ^
        imageUrl.hashCode ^
        weight.hashCode;
  }
}
