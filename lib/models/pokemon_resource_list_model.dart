// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PokemonResourceListModel {
  final String name;
  final String url;
  PokemonResourceListModel({
    required this.name,
    required this.url,
  });

  PokemonResourceListModel copyWith({
    String? name,
    String? url,
  }) {
    return PokemonResourceListModel(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'url': url,
    };
  }

  factory PokemonResourceListModel.fromMap(Map<String, dynamic> map) {
    return PokemonResourceListModel(
      name: map['name'] as String,
      url: map['url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonResourceListModel.fromJson(String source) =>
      PokemonResourceListModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PokemonResourceListModel(name: $name, url: $url)';

  @override
  bool operator ==(covariant PokemonResourceListModel other) {
    if (identical(this, other)) return true;

    return other.name == name && other.url == url;
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode;
}
