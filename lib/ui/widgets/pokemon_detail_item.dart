import "package:flutter/material.dart";
import "package:pokemon_flutter/models/pokemon_detail_model.dart";
import "package:pokemon_flutter/ui/screens/home_screen.dart";
import "package:pokemon_flutter/ui/widgets/pokemon_berry_list.dart";
import "package:pokemon_flutter/ui/widgets/pokemon_detail_item_attribute.dart";

class PokemonDetailItem extends StatelessWidget {
  final PokemonDetailModel data;
  const PokemonDetailItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${data.name[0].toUpperCase()}${data.name.substring(1).toLowerCase()}",
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Stack(children: [
            Image.network(
              data.imageUrl,
              height: 200,
            ),
            Positioned(
                right: 0,
                child: GestureDetector(
                  onTap: () => _dialogBuilder(context),
                  child: const Icon(
                    Icons.highlight_remove_sharp,
                    color: Colors.red,
                  ),
                ))
          ]),
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
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete pokemon'),
          content: const Text('Are you sure to delete this pokemon?'),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Yes'),
              onPressed: () {
                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (context) {
                  return const HomeScreen();
                }));
              },
            ),
          ],
        );
      },
    );
  }
}
