// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:pokemon_flutter/models/pokemon_model.dart';

class GetPokemonResponseModel {
  final int count;
  final String? next;
  final String? previous;
  final List<PokemonModel> results;
  GetPokemonResponseModel({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  GetPokemonResponseModel copyWith({
    int? count,
    String? next,
    String? previous,
    List<PokemonModel>? results,
  }) {
    return GetPokemonResponseModel(
      count: count ?? this.count,
      next: next ?? this.next,
      previous: previous ?? this.previous,
      results: results ?? this.results,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'count': count,
      'next': next,
      'previous': previous,
      'results': results.map((x) => x.toMap()).toList(),
    };
  }

  factory GetPokemonResponseModel.fromMap(Map<String, dynamic> map) {
    return GetPokemonResponseModel(
      count: map['count'] as int,
      next: map['next'] as String?,
      previous: map['previous'] as String?,
      results: List<PokemonModel>.from(
        (map['results'] as List<dynamic>).map<PokemonModel>(
          (x) => PokemonModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory GetPokemonResponseModel.fromJson(String source) =>
      GetPokemonResponseModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'GetPokemonResponseModel(count: $count, next: $next, previous: $previous, results: $results)';
  }

  @override
  bool operator ==(covariant GetPokemonResponseModel other) {
    if (identical(this, other)) return true;

    return other.count == count &&
        other.next == next &&
        other.previous == previous &&
        listEquals(other.results, results);
  }

  @override
  int get hashCode {
    return count.hashCode ^
        next.hashCode ^
        previous.hashCode ^
        results.hashCode;
  }
}
