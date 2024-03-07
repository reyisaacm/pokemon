// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ResourceListResultResponseModel {
  final String name;
  final String url;
  ResourceListResultResponseModel({
    required this.name,
    required this.url,
  });

  ResourceListResultResponseModel copyWith({
    String? name,
    String? url,
  }) {
    return ResourceListResultResponseModel(
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

  factory ResourceListResultResponseModel.fromMap(Map<String, dynamic> map) {
    return ResourceListResultResponseModel(
      name: map['name'] as String,
      url: map['url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResourceListResultResponseModel.fromJson(String source) =>
      ResourceListResultResponseModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ResourceListResultResponseModel(name: $name, url: $url)';

  @override
  bool operator ==(covariant ResourceListResultResponseModel other) {
    if (identical(this, other)) return true;

    return other.name == name && other.url == url;
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode;
}
