
import "package:flutter/material.dart";

class PokememonItem extends StatelessWidget {
  final String imageUrl;
  final int id;
  final bool isSelected;

  const PokememonItem(
      {super.key,
      required this.imageUrl,
      required this.id,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: isSelected ? Theme.of(context).colorScheme.tertiary : null,
          child: imageUrl == ""
              ? Image.asset("assets/images/pokemon-icon.png")
              : Image.network(imageUrl),
        )
      ],
    );
  }
}
