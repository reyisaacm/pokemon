// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';


class StatResponseModel {
  final int baseStat;

  StatResponseModel({
    required this.baseStat,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'baseStat': baseStat,
    };
  }

  factory StatResponseModel.fromMap(Map<String, dynamic> map) {
    return StatResponseModel(
      baseStat: map['base_stat'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory StatResponseModel.fromJson(String source) =>
      StatResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
