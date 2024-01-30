import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:pokemon_flutter/bloc/pokemon/pokemon_bloc.dart";
import "package:pokemon_flutter/models/pokemon_detail_model.dart";
import "package:pokemon_flutter/models/pokemon_model.dart";
import "package:pokemon_flutter/ui/widgets/pokemon_item.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PokemonBloc _pokemonBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pokemonBloc = BlocProvider.of(context);
    _pokemonBloc.add(PokemonFetched());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pokemon"), centerTitle: true),
      body: Column(
        children: [
          Row(
            children: [
              Text(
                "Search Box",
              )
            ],
          ),
          Row(
            children: [
              BlocBuilder<PokemonBloc, PokemonState>(
                builder: (context, state) {
                  if (state is PokemonFailure) {
                    return Center(
                      child: Text(state.error),
                    );
                  }

                  if (state is! PokemonSuccess) {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  }

                  List<PokemonDetailModel> data = state.listPokemonDetailModel;

                  return Expanded(
                    child: ListView.builder(itemBuilder: ((context, index) {
                      return PokememonItem(
                          imageUrl: data[index].imageUrl,
                          id: data[index].id,
                          isSelected: false);
                    })),
                  );
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
