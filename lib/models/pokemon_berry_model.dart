// ignore_for_file: public_member_api_docs, sort_constructors_first

class PokemonBerryModel {
  int id;
  String firmness;
  String name;
  String imageUrl;
  int weight;
  bool isSelected = false;
  PokemonBerryModel({
    required this.id,
    required this.firmness,
    required this.name,
    required this.imageUrl,
    required this.weight,
  });
}
