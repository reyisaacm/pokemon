// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:pokemon_flutter/models/remote/evolution_chain/chain_model.dart';

class ResourceDetailEvolutionChainResponseModel {
  final ChainResponseModel? chain;
  final int id;

  ResourceDetailEvolutionChainResponseModel({
    required this.chain,
    required this.id,
  });

  ResourceDetailEvolutionChainResponseModel copyWith({
    ChainResponseModel? chain,
    int? id,
  }) {
    return ResourceDetailEvolutionChainResponseModel(
      chain: chain ?? this.chain,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'chain': chain?.toMap(),
      'id': id,
    };
  }

  factory ResourceDetailEvolutionChainResponseModel.fromMap(
      Map<String, dynamic> map) {
    return ResourceDetailEvolutionChainResponseModel(
      chain: ChainResponseModel.fromMap(map['chain'] as Map<String, dynamic>),
      id: map['id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResourceDetailEvolutionChainResponseModel.fromJson(String source) =>
      ResourceDetailEvolutionChainResponseModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ResourceDetailEvolutionChainResponseModel(chain: $chain, id: $id)';

  @override
  bool operator ==(covariant ResourceDetailEvolutionChainResponseModel other) {
    if (identical(this, other)) return true;

    return other.chain == chain && other.id == id;
  }

  @override
  int get hashCode => chain.hashCode ^ id.hashCode;
}
