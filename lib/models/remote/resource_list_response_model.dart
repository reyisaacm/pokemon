// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:pokemon_flutter/models/remote/resource_list_result_response_model.dart';

class ResourceListResponseModel {
  final int count;
  final String? next;
  final String? previous;
  final List<ResourceListResultResponseModel> results;
  ResourceListResponseModel({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  ResourceListResponseModel copyWith({
    int? count,
    String? next,
    String? previous,
    List<ResourceListResultResponseModel>? results,
  }) {
    return ResourceListResponseModel(
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

  factory ResourceListResponseModel.fromMap(Map<String, dynamic> map) {
    return ResourceListResponseModel(
      count: map['count'] as int,
      next: map['next'] as String?,
      previous: map['previous'] as String?,
      results: List<ResourceListResultResponseModel>.from(
        (map['results'] as List<dynamic>).map<ResourceListResultResponseModel>(
          (x) => ResourceListResultResponseModel.fromMap(
              x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ResourceListResponseModel.fromJson(String source) =>
      ResourceListResponseModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'GetPokemonResourceListResponseModel(count: $count, next: $next, previous: $previous, results: $results)';
  }

  @override
  bool operator ==(covariant ResourceListResponseModel other) {
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
