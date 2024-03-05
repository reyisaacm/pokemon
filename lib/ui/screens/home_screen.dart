import "dart:async";

import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:pokemon_flutter/bloc/pokemon/pokemon_bloc.dart";
import 'package:pokemon_flutter/models/pokemon_list_item_model.dart';
import "package:pokemon_flutter/ui/screens/detail_screen.dart";
import 'package:pokemon_flutter/ui/widgets/pokemon_button.dart';
import "package:pokemon_flutter/ui/widgets/pokemon_item.dart";
import "package:pokemon_flutter/ui/widgets/pokemon_list.dart";
import "package:pokemon_flutter/ui/widgets/pokemon_search.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PokemonBloc _pokemonBloc;

  final int defaultLimit = 30;
  final int defaultOffset = 0;
  bool isEnabled = false;
  bool isTextFieldReadOnly = false;
  List<PokemonListItemModel> data = [];
  PokemonListItemModel? selectedPokemon;
  String? search;

  @override
  void initState() {
    super.initState();
    _pokemonBloc = context.read<PokemonBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pokemon"), centerTitle: true),
      body: BlocListener(
        bloc: _pokemonBloc,
        listener: (context, state) {
          // if (state is PokemonClear) {
          //   data = [];
          //   _pokemonBloc.add(PokemonFetched(limit, offset, search));
          // }

          if (state is PokemonClear) {
            data = [];
            _pokemonBloc
                .add(PokemonFetched(defaultLimit, defaultOffset, search));
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              PokemonSearch(
                onChangedCallback: (value) {
                  setState(() {
                    search = value;
                  });
                  _pokemonBloc.add(PokemonCleared());
                },
              ),
              const SizedBox(
                height: 8,
              ),
              BlocListener<PokemonBloc, PokemonState>(
                listener: (context, state) {
                  if (state is PokemonSelect) {
                    isEnabled = true;
                  }

                  if (state is PokemonClear) {
                    isEnabled = false;
                  }
                },
                child: BlocBuilder<PokemonBloc, PokemonState>(
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

                    return Expanded(
                      child: Column(
                        children: [
                          Flexible(
                            child: PokemonList(
                              listData: data,
                              search: search,
                            ),
                          ),
                          SafeArea(
                            child: Builder(
                              builder: (context) {
                                if (state is PokemonLoading) {
                                  return const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 16),
                                    child: Center(
                                      child:
                                          CircularProgressIndicator.adaptive(),
                                    ),
                                  );
                                } else {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12),
                                    child: PokemonButton(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      isEnabled: isEnabled,
                                      onTap: () {
                                        int idSelected = selectedPokemon!.id;
                                        selectedPokemon = null;
                                        Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return DetailScreen(
                                            id: idSelected,
                                          );
                                        }));
                                      },
                                      buttonText: "I Choose You",
                                    ),
                                  );
                                }
                              },
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
