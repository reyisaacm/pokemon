// ignore_for_file: public_member_api_docs, sort_constructors_first

class PokemonListItemModel {
  final int id;
  final String name;
  final String imageUrl;
  bool isSelected = false;

  PokemonListItemModel({
    required this.id,
    required this.name,
    required this.imageUrl,
  });
}
