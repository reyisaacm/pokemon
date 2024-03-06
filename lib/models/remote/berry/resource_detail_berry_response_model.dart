// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:pokemon_flutter/models/remote/berry/firmness_model.dart';

class ResourceDetailBerryResponseModel {
  final FirmnessModel firmness;
  final int growthTime;
  final int id;
  final FirmnessModel item;
  final int maxHarvest;
  final String name;
  final int naturalGiftPower;
  final FirmnessModel naturalGiftType;
  final int size;
  final int smoothness;
  final int soilDryness;

  ResourceDetailBerryResponseModel({
    required this.firmness,
    required this.growthTime,
    required this.id,
    required this.item,
    required this.maxHarvest,
    required this.name,
    required this.naturalGiftPower,
    required this.naturalGiftType,
    required this.size,
    required this.smoothness,
    required this.soilDryness,
  });

  ResourceDetailBerryResponseModel copyWith({
    FirmnessModel? firmness,
    int? growthTime,
    int? id,
    FirmnessModel? item,
    int? maxHarvest,
    String? name,
    int? naturalGiftPower,
    FirmnessModel? naturalGiftType,
    int? size,
    int? smoothness,
    int? soilDryness,
  }) {
    return ResourceDetailBerryResponseModel(
      firmness: firmness ?? this.firmness,
      growthTime: growthTime ?? this.growthTime,
      id: id ?? this.id,
      item: item ?? this.item,
      maxHarvest: maxHarvest ?? this.maxHarvest,
      name: name ?? this.name,
      naturalGiftPower: naturalGiftPower ?? this.naturalGiftPower,
      naturalGiftType: naturalGiftType ?? this.naturalGiftType,
      size: size ?? this.size,
      smoothness: smoothness ?? this.smoothness,
      soilDryness: soilDryness ?? this.soilDryness,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firmness': firmness.toMap(),
      'growthTime': growthTime,
      'id': id,
      'item': item.toMap(),
      'maxHarvest': maxHarvest,
      'name': name,
      'naturalGiftPower': naturalGiftPower,
      'naturalGiftType': naturalGiftType.toMap(),
      'size': size,
      'smoothness': smoothness,
      'soilDryness': soilDryness,
    };
  }

  factory ResourceDetailBerryResponseModel.fromMap(Map<String, dynamic> map) {
    return ResourceDetailBerryResponseModel(
      firmness: FirmnessModel.fromMap(map['firmness'] as Map<String, dynamic>),
      growthTime: map['growthTime'] as int,
      id: map['id'] as int,
      item: FirmnessModel.fromMap(map['item'] as Map<String, dynamic>),
      maxHarvest: map['maxHarvest'] as int,
      name: map['name'] as String,
      naturalGiftPower: map['naturalGiftPower'] as int,
      naturalGiftType:
          FirmnessModel.fromMap(map['naturalGiftType'] as Map<String, dynamic>),
      size: map['size'] as int,
      smoothness: map['smoothness'] as int,
      soilDryness: map['soilDryness'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResourceDetailBerryResponseModel.fromJson(String source) =>
      ResourceDetailBerryResponseModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ResourceDetailBerryResponseModel(firmness: $firmness, growthTime: $growthTime, id: $id, item: $item, maxHarvest: $maxHarvest, name: $name, naturalGiftPower: $naturalGiftPower, naturalGiftType: $naturalGiftType, size: $size, smoothness: $smoothness, soilDryness: $soilDryness)';
  }

  @override
  bool operator ==(covariant ResourceDetailBerryResponseModel other) {
    if (identical(this, other)) return true;

    return other.firmness == firmness &&
        other.growthTime == growthTime &&
        other.id == id &&
        other.item == item &&
        other.maxHarvest == maxHarvest &&
        other.name == name &&
        other.naturalGiftPower == naturalGiftPower &&
        other.naturalGiftType == naturalGiftType &&
        other.size == size &&
        other.smoothness == smoothness &&
        other.soilDryness == soilDryness;
  }

  @override
  int get hashCode {
    return firmness.hashCode ^
        growthTime.hashCode ^
        id.hashCode ^
        item.hashCode ^
        maxHarvest.hashCode ^
        name.hashCode ^
        naturalGiftPower.hashCode ^
        naturalGiftType.hashCode ^
        size.hashCode ^
        smoothness.hashCode ^
        soilDryness.hashCode;
  }
}
