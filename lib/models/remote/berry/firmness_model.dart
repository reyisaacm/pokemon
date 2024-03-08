// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class FirmnessResponseModel {
  final String name;
  final String url;

  FirmnessResponseModel({
    required this.name,
    required this.url,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'url': url,
    };
  }

  factory FirmnessResponseModel.fromMap(Map<String, dynamic> map) {
    return FirmnessResponseModel(
      name: map['name'] as String,
      url: map['url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory FirmnessResponseModel.fromJson(String source) =>
      FirmnessResponseModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
