// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class EvolutionChainModel {
  final String url;

  EvolutionChainModel({
    required this.url,
  });

  EvolutionChainModel copyWith({
    String? url,
  }) {
    return EvolutionChainModel(
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'url': url,
    };
  }

  factory EvolutionChainModel.fromMap(Map<String, dynamic> map) {
    return EvolutionChainModel(
      url: map['url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory EvolutionChainModel.fromJson(String source) =>
      EvolutionChainModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'EvolutionChainModel(url: $url)';

  @override
  bool operator ==(covariant EvolutionChainModel other) {
    if (identical(this, other)) return true;

    return other.url == url;
  }

  @override
  int get hashCode => url.hashCode;
}
