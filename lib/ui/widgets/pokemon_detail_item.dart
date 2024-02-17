import "package:flutter/material.dart";
import "package:pokemon_flutter/models/pokemon_detail_model.dart";
import "package:pokemon_flutter/ui/widgets/pokemon_berry_list.dart";
import "package:pokemon_flutter/ui/widgets/pokemon_detail_item_attribute.dart";

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
              "${data.name[0].toUpperCase()}${data.name.substring(1).toLowerCase()}",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Image.network(
          data.imageUrl,
          height: 200,
        ),
        const SizedBox(
          height: 15,
        ),
        PokemonDetailItemAttribute(
          name: "HP",
          value: "${data.hp}",
        ),
        const PokemonDetailItemAttribute(
          name: "Attack",
          value: "100",
        ),
        PokemonDetailItemAttribute(
          name: "Defense",
          value: "${data.defense}",
        ),
        PokemonDetailItemAttribute(
          name: "Speed",
          value: "${data.speed}",
        ),
        PokemonDetailItemAttribute(
          name: "Weight",
          value: "${data.weight}",
        ),
        const SizedBox(
          height: 15,
        ),
        const PokemonBerryList()
      ],
    );
  }
}
