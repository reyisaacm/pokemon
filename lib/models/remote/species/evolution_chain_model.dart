// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class EvolutionChainResponseModel {
  final String url;

  EvolutionChainResponseModel({
    required this.url,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'url': url,
    };
  }

  factory EvolutionChainResponseModel.fromMap(Map<String, dynamic> map) {
    return EvolutionChainResponseModel(
      url: map['url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory EvolutionChainResponseModel.fromJson(String source) =>
      EvolutionChainResponseModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
