// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:pokemon_flutter/models/remote/item/sprites_model.dart';

class ResourceDetailItemResponseModel {
  final int cost;
  final int flingPower;
  final int id;
  final String name;
  final SpritesModel sprites;

  ResourceDetailItemResponseModel({
    required this.cost,
    required this.flingPower,
    required this.id,
    required this.name,
    required this.sprites,
  });

  ResourceDetailItemResponseModel copyWith({
    int? cost,
    int? flingPower,
    int? id,
    String? name,
    SpritesModel? sprites,
  }) {
    return ResourceDetailItemResponseModel(
      cost: cost ?? this.cost,
      flingPower: flingPower ?? this.flingPower,
      id: id ?? this.id,
      name: name ?? this.name,
      sprites: sprites ?? this.sprites,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cost': cost,
      'flingPower': flingPower,
      'id': id,
      'name': name,
      'sprites': sprites.toMap(),
    };
  }

  factory ResourceDetailItemResponseModel.fromMap(Map<String, dynamic> map) {
    return ResourceDetailItemResponseModel(
      cost: map['cost'] as int,
      flingPower: map['flingPower'] as int,
      id: map['id'] as int,
      name: map['name'] as String,
      sprites: SpritesModel.fromMap(map['sprites'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory ResourceDetailItemResponseModel.fromJson(String source) =>
      ResourceDetailItemResponseModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ResourceDetailItemResponseModel(cost: $cost, flingPower: $flingPower, id: $id, name: $name, sprites: $sprites)';
  }

  @override
  bool operator ==(covariant ResourceDetailItemResponseModel other) {
    if (identical(this, other)) return true;

    return other.cost == cost &&
        other.flingPower == flingPower &&
        other.id == id &&
        other.name == name &&
        other.sprites == sprites;
  }

  @override
  int get hashCode {
    return cost.hashCode ^
        flingPower.hashCode ^
        id.hashCode ^
        name.hashCode ^
        sprites.hashCode;
  }
}
