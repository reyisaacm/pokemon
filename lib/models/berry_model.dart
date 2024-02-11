// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class BerryModel {
  int id;
  String firmness;
  String name;
  String imageUrl;
  int weight;
  BerryModel({
    required this.id,
    required this.firmness,
    required this.name,
    required this.imageUrl,
    required this.weight,
  });

  BerryModel copyWith({
    int? id,
    String? firmness,
    String? name,
    String? imageUrl,
    int? weight,
  }) {
    return BerryModel(
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

  factory BerryModel.fromMap(Map<String, dynamic> map) {
    return BerryModel(
      id: map['id'] as int,
      firmness: map['firmness'] as String,
      name: map['name'] as String,
      imageUrl: map['imageUrl'] as String,
      weight: map['weight'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory BerryModel.fromJson(String source) =>
      BerryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BerryModel(id: $id, firmness: $firmness, name: $name, imageUrl: $imageUrl, weight: $weight)';
  }

  @override
  bool operator ==(covariant BerryModel other) {
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
