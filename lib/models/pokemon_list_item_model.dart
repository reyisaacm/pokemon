// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PokemonListItemModel {
  final int id;
  final String name;
  final String imageUrl;
  bool isSelected = false;

  PokemonListItemModel({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  PokemonListItemModel copyWith({
    int? id,
    String? name,
    String? imageUrl,
    bool? isSelected,
  }) {
    return PokemonListItemModel(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
    };
  }

  factory PokemonListItemModel.fromMap(Map<String, dynamic> map) {
    return PokemonListItemModel(
      id: map['id'] as int,
      name: map['name'] as String,
      imageUrl: map['sprites']['front_default'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonListItemModel.fromJson(String source) =>
      PokemonListItemModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PokemonListItemModel(id: $id, name: $name, imageUrl: $imageUrl, isSelected: $isSelected)';
  }

  @override
  bool operator ==(covariant PokemonListItemModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.imageUrl == imageUrl &&
        other.isSelected == isSelected;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        imageUrl.hashCode ^
        isSelected.hashCode;
  }
}
