import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:pokemon_flutter/bloc/pokemon_detail/pokemon_detail_bloc.dart";
import "package:pokemon_flutter/bloc/storage/storage_bloc.dart";
import "package:pokemon_flutter/models/pokemon_detail_model.dart";
import "package:pokemon_flutter/ui/screens/home_screen.dart";
import "package:pokemon_flutter/ui/widgets/pokemon_berry_list.dart";
import "package:pokemon_flutter/ui/widgets/pokemon_button.dart";
import "package:pokemon_flutter/ui/widgets/pokemon_detail_item_attribute.dart";
import "package:pokemon_flutter/ui/widgets/pokemon_dialog.dart";

class PokemonDetailItem extends StatefulWidget {
  final PokemonDetailModel data;
  const PokemonDetailItem({super.key, required this.data});

  @override
  State<PokemonDetailItem> createState() => _PokemonDetailItemState();
}

class _PokemonDetailItemState extends State<PokemonDetailItem> {
  late StorageBloc _storageBloc;
  late PokemonDetailBloc _pokemonDetailBloc;

  @override
  void initState() {
    super.initState();
    _storageBloc = BlocProvider.of(context);
    _pokemonDetailBloc = context.read<PokemonDetailBloc>();
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
                  onTap: () => showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return PokemonDialog(
                          onConfirm: () {
                            _storageBloc.add(StorageDeleted());
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                                    maintainState: false,
                                    builder: (context) {
                                      return const HomeScreen();
                                    }));
                          },
                          onCancel: () {
                            Navigator.of(context).pop();
                          },
                          title: "Delete pokemon",
                          content: "Are you sure to delete this pokemon?");
                    },
                  ),
                  child: const Icon(
                    Icons.highlight_remove_sharp,
                    color: Colors.red,
                    size: 30,
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
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: PokemonButton(
                          isEnabled: true,
                          onTap: () => showDialog<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  return PokemonDialog(
                                      onConfirm: () {
                                        _storageBloc.add(StorageDeleted());
                                        _pokemonDetailBloc.add(
                                            PokemonDetailEvolved(
                                                widget.data.evolution!.id,
                                                widget.data.weight));
                                        Navigator.of(context).pop();
                                      },
                                      onCancel: () {
                                        Navigator.of(context).pop();
                                      },
                                      title: "Evolve pokemon",
                                      content:
                                          "Are you sure to evolve this pokemon?");
                                },
                              ),
                          buttonText: "Evolution",
                          color: const Color.fromRGBO(255, 192, 0, 1)),
                    )
                  : Container();
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
}
