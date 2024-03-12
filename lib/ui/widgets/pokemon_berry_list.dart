import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:pokemon_flutter/bloc/pokemon_berry/pokemon_berry_bloc.dart";
import "package:pokemon_flutter/bloc/storage/storage_bloc.dart";
import "package:pokemon_flutter/models/pokemon_berry_model.dart";
import 'package:pokemon_flutter/ui/widgets/pokemon_button.dart';

class PokemonBerryList extends StatefulWidget {
  const PokemonBerryList({
    super.key,
  });

  @override
  State<PokemonBerryList> createState() => _PokemonBerryListState();
}

class _PokemonBerryListState extends State<PokemonBerryList> {
  late PokemonBerryBloc _pokemonBerryBloc;
  late StorageBloc _storageBloc;
  List<PokemonBerryModel> data = [];
  PokemonBerryModel? selectedData;
  bool isEnableButton = false;

  @override
  void initState() {
    super.initState();
    _pokemonBerryBloc = BlocProvider.of(context);
    _pokemonBerryBloc.add(BerryFetched());
    _storageBloc = BlocProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonBerryBloc, PokemonBerryState>(
        builder: ((context, state) {
      if (state is PokemonBerryFailure) {
        return Center(
          child: Text(state.error),
        );
      }

      if (state is PokemonBerryLoading) {
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      }

      if (state is PokemonBerrySuccess) {
        data = [];
        selectedData = null;
        data.addAll(state.listData);
      }

      if (state is PokemonBerrySelect) {
        data = state.listPokemonBerryModel;
        selectedData = state.selectedBerry;
      }

      return Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.75,
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).colorScheme.primary),
              borderRadius: BorderRadius.circular(5),
            ),
            child: (ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  bool isSelected = data[index].isSelected;
                  return GestureDetector(
                    onTap: () {
                      _pokemonBerryBloc.add(BerrySelected(data, index));
                    },
                    child: Container(
                      color: isSelected
                          ? Theme.of(context).colorScheme.tertiary
                          : null,
                      // child: Image.network(data[index].imageUrl),
                      child: CachedNetworkImage(imageUrl: data[index].imageUrl),
                    ),
                  );
                })),
          ),
          Text(selectedData != null
              ? "${selectedData!.name} (${selectedData!.firmness})"
              : ""),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.90,
            child: PokemonButton(
                color: Theme.of(context).colorScheme.primary,
                isEnabled: selectedData != null ? true : false,
                onTap: () {
                  _storageBloc.add(StorageWeightUpdated(
                      selectedData!.weight, selectedData!.firmness));
                },
                buttonText: "Feed Pokemon"),
          )
        ],
      );
    }));
  }
}
