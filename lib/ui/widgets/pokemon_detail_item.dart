import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:pokemon_flutter/bloc/storage/storage_bloc.dart";
import "package:pokemon_flutter/models/pokemon_detail_model.dart";
import "package:pokemon_flutter/ui/screens/home_screen.dart";
import "package:pokemon_flutter/ui/widgets/pokemon_berry_list.dart";
import "package:pokemon_flutter/ui/widgets/pokemon_button.dart";
import "package:pokemon_flutter/ui/widgets/pokemon_detail_item_attribute.dart";

class PokemonDetailItem extends StatefulWidget {
  final PokemonDetailModel data;
  const PokemonDetailItem({super.key, required this.data});

  @override
  State<PokemonDetailItem> createState() => _PokemonDetailItemState();
}

class _PokemonDetailItemState extends State<PokemonDetailItem> {
  late StorageBloc _storageBloc;

  @override
  void initState() {
    super.initState();
    _storageBloc = BlocProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${widget.data.name[0].toUpperCase()}${widget.data.name.substring(1).toLowerCase()}",
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
              widget.data.imageUrl,
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
          BlocBuilder<StorageBloc, StorageState>(
            builder: (context, state) {
              final int? weightForEvolution = widget.data.evolution?.weight;
              bool isEligibleForEvolution = false;

              if (weightForEvolution != null &&
                  widget.data.weight >= weightForEvolution) {
                isEligibleForEvolution = true;
              }

              return isEligibleForEvolution
                  ? SizedBox(
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: PokemonButton(
                          isEnabled: true,
                          onTap: () {},
                          buttonText: "Evolution",
                          color: const Color.fromRGBO(255, 192, 0, 1)),
                    )
                  : Text("$weightForEvolution");
            },
          ),
          const SizedBox(
            height: 15,
          ),
          PokemonDetailItemAttribute(
            name: "HP",
            value: "${widget.data.hp}",
          ),
          const PokemonDetailItemAttribute(
            name: "Attack",
            value: "100",
          ),
          PokemonDetailItemAttribute(
            name: "Defense",
            value: "${widget.data.defense}",
          ),
          PokemonDetailItemAttribute(
            name: "Speed",
            value: "${widget.data.speed}",
          ),
          PokemonDetailItemAttribute(
            name: "Weight",
            value: "${widget.data.weight}",
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
                _storageBloc.add(StorageDeleted());
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
