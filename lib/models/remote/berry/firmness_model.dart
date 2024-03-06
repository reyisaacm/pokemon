// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class FirmnessModel {
  final String name;
  final String url;

  FirmnessModel({
    required this.name,
    required this.url,
  });

  FirmnessModel copyWith({
    String? name,
    String? url,
  }) {
    return FirmnessModel(
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

  factory FirmnessModel.fromMap(Map<String, dynamic> map) {
    return FirmnessModel(
      name: map['name'] as String,
      url: map['url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory FirmnessModel.fromJson(String source) =>
      FirmnessModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'FirmnessModel(name: $name, url: $url)';

  @override
  bool operator ==(covariant FirmnessModel other) {
    if (identical(this, other)) return true;

    return other.name == name && other.url == url;
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode;
}
