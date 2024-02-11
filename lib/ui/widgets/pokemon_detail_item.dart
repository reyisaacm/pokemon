import "package:flutter/material.dart";
import "package:pokemon_flutter/models/pokemon_detail_model.dart";

class PokemonDetailItem extends StatelessWidget {
  final PokemonDetailModel data;

  const PokemonDetailItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              data.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Image.network(
          data.imageUrl,
          height: 200,
        ),
      ],
    );
  }
}
