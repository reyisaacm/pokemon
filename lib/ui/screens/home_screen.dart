import "dart:async";

import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:pokemon_flutter/bloc/pokemon/pokemon_bloc.dart";
import 'package:pokemon_flutter/models/pokemon_list_item_model.dart';
import "package:pokemon_flutter/ui/screens/detail_screen.dart";
import 'package:pokemon_flutter/ui/widgets/pokemon_button.dart';
import "package:pokemon_flutter/ui/widgets/pokemon_item.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PokemonBloc _pokemonBloc;
  final int limit = 30;
  int offset = 0;
  bool isEnabled = false;
  bool isTextFieldReadOnly = false;
  List<PokemonListItemModel> data = [];
  late PokemonListItemModel? selectedPokemon;
  final ScrollController _scrollController = ScrollController();
  Timer? _timer;
  String? search;

  @override
  void initState() {
    super.initState();
    _pokemonBloc = context.read<PokemonBloc>();
    _pokemonBloc.add(PokemonCleared());
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        setState(() {
          offset = offset + limit;
        });
        _pokemonBloc.add(PokemonFetched(limit, offset, search));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pokemon"), centerTitle: true),
      body: BlocListener(
        bloc: _pokemonBloc,
        listener: (context, state) {
          if (state is PokemonClear) {
            data = [];
            _pokemonBloc.add(PokemonFetched(limit, offset, search));
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              TextField(
                // readOnly: isTextFieldReadOnly,
                onChanged: (String value) {
                  if (_timer?.isActive ?? false) _timer?.cancel();
                  _timer = Timer(const Duration(milliseconds: 500), () {
                    setState(() {
                      search = value;
                      offset = 0;
                      data = [];
                      selectedPokemon = null;
                      _pokemonBloc.add(PokemonFetched(limit, offset, search));
                    });
                  });
                },
                decoration: InputDecoration(
                  hintText: "Search Pokemon",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  // fillColor: isTextFieldReadOnly
                  //     ? Theme.of(context).colorScheme.inversePrimary
                  //     : Theme.of(context).colorScheme.background,
                  // filled: true,
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
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: PokemonButton(
                          color: Theme.of(context).colorScheme.primary,
                          isEnabled: isEnabled,
                          onTap: () {
                            // _storageBloc.add(StorageWritten(selectedPokemon!));
                            // print("tapped");
                            int idSelected = selectedPokemon!.id;
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                                    // maintainState: false,
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
        ),
      ),
    );
  }
}
