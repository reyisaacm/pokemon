// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SpeciesResponseModel {
  final String name;
  final String url;

  SpeciesResponseModel({
    required this.name,
    required this.url,
  });

  SpeciesResponseModel copyWith({
    String? name,
    String? url,
  }) {
    return SpeciesResponseModel(
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

  factory SpeciesResponseModel.fromMap(Map<String, dynamic> map) {
    return SpeciesResponseModel(
      name: map['name'] as String,
      url: map['url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SpeciesResponseModel.fromJson(String source) =>
      SpeciesResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Species(name: $name, url: $url)';

  @override
  bool operator ==(covariant SpeciesResponseModel other) {
    if (identical(this, other)) return true;

    return other.name == name && other.url == url;
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode;
}
