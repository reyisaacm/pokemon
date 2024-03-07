// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:pokemon_flutter/models/remote/item/sprites_model.dart';

class ResourceDetailItemResponseModel {
  final int cost;
  final int flingPower;
  final int id;
  final String name;
  final SpritesResponseModel sprites;

  ResourceDetailItemResponseModel({
    required this.cost,
    required this.flingPower,
    required this.id,
    required this.name,
    required this.sprites,
  });

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
      flingPower: map['fling_power'] as int,
      id: map['id'] as int,
      name: map['name'] as String,
      sprites:
          SpritesResponseModel.fromMap(map['sprites'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory ResourceDetailItemResponseModel.fromJson(String source) =>
      ResourceDetailItemResponseModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
