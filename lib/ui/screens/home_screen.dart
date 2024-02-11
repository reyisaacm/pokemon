import "dart:convert";

import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:pokemon_flutter/bloc/pokemon/pokemon_bloc.dart";
import "package:pokemon_flutter/bloc/storage/storage_bloc.dart";
import 'package:pokemon_flutter/models/pokemon_list_item_model.dart';
import "package:pokemon_flutter/ui/screens/detail_screen.dart";
import "package:pokemon_flutter/ui/widgets/pokemon_button_primary.dart";
import "package:pokemon_flutter/ui/widgets/pokemon_item.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PokemonBloc _pokemonBloc;
  late StorageBloc _storageBloc;
  final int limit = 30;
  int offset = 0;
  bool isEnabled = false;
  List<PokemonListItemModel> data = [];
  late PokemonListItemModel? selectedPokemon;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pokemonBloc = BlocProvider.of(context);
    _pokemonBloc.add(PokemonFetched(limit, offset));

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        setState(() {
          offset = offset + limit;
        });
        _pokemonBloc.add(PokemonFetched(limit, offset));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pokemon"), centerTitle: true),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Search Pokemon",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            BlocBuilder<PokemonBloc, PokemonState>(
              bloc: _pokemonBloc,
              builder: (context, state) {
                if (state is PokemonFailure) {
                  return Center(
                    child: Text(state.error),
                  );
                }

                if (state is PokemonSuccess) {
                  data.addAll(state.listPokemonListItemModel);
                }

                if (state is PokemonSelect) {
                  data = state.listPokemonListItemModel;
                  selectedPokemon = state.selectedPokemon;
                }

                return Flexible(
                  child: GridView.builder(
                      controller: _scrollController,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4),
                      itemCount: data.length,
                      itemBuilder: ((context, index) {
                        return GestureDetector(
                          onTap: () {
                            _pokemonBloc.add(PokemonSelected(data, index));
                            setState(() {
                              isEnabled = true;
                            });
                          },
                          child: PokememonItem(
                              imageUrl: data[index].imageUrl,
                              id: data[index].id,
                              isSelected: data[index].isSelected),
                        );
                      })),
                );
              },
            ),
            SafeArea(
              child: BlocBuilder<PokemonBloc, PokemonState>(
                builder: (context, state) {
                  if (state is PokemonLoading) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Center(
                        child: CircularProgressIndicator.adaptive(),
                      ),
                    );
                  } else {
                    return PokemonButtonPrimary(
                      isEnabled: isEnabled,
                      onTap: () {
                        // _storageBloc.add(StorageWritten(selectedPokemon!));
                        // print("tapped");
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) {
                          return DetailScreen(
                            id: selectedPokemon!.id,
                          );
                        }));
                      },
                      buttonText: "I Choose You",
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
