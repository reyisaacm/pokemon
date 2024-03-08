// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';


import 'package:pokemon_flutter/models/remote/berry/firmness_model.dart';

class ResourceDetailBerryResponseModel {
  final FirmnessResponseModel firmness;
  final int id;
  final FirmnessResponseModel item;
  final String name;

  ResourceDetailBerryResponseModel({
    required this.firmness,
    required this.id,
    required this.item,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firmness': firmness.toMap(),
      'id': id,
      'item': item.toMap(),
      'name': name,
    };
  }

  factory ResourceDetailBerryResponseModel.fromMap(Map<String, dynamic> map) {
    return ResourceDetailBerryResponseModel(
      firmness: FirmnessResponseModel.fromMap(
          map['firmness'] as Map<String, dynamic>),
      id: map['id'] as int,
      item: FirmnessResponseModel.fromMap(map['item'] as Map<String, dynamic>),
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResourceDetailBerryResponseModel.fromJson(String source) =>
      ResourceDetailBerryResponseModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
