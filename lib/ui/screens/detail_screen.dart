import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:pokemon_flutter/bloc/pokemon_detail/pokemon_detail_bloc.dart";
import "package:pokemon_flutter/bloc/storage/storage_bloc.dart";
import "package:pokemon_flutter/models/pokemon_detail_model.dart";
import "package:pokemon_flutter/ui/widgets/pokemon_detail_item.dart";

class DetailScreen extends StatefulWidget {
  final int id;

  const DetailScreen({super.key, required this.id});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late StorageBloc _storageBloc;
  late PokemonDetailBloc _pokemonDetailBloc;
  @override
  void initState() {
    super.initState();
    _storageBloc = context.read<StorageBloc>();
    _pokemonDetailBloc = context.read<PokemonDetailBloc>();
    _storageBloc.add(StorageLoaded());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pokemon Detail"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            MultiBlocListener(
              listeners: [
                BlocListener(
                  bloc: _pokemonDetailBloc,
                  listener: (context, state) {
                    if (state is PokemonDetailSuccess) {
                      _storageBloc.add(StorageWritten(state.data));
                    }
                    if (state is PokemonDetailFailure) {
                      _storageBloc.add(StorageFailed(state.error));
                    }
                  },
                ),
                BlocListener<StorageBloc, StorageState>(
                  listener: (context, state) {
                    if (state is StorageEmpty) {
                      _pokemonDetailBloc.add(PokemonDetailFetched(widget.id));
                    }
                  },
                ),
              ],
              child: BlocBuilder<StorageBloc, StorageState>(
                  bloc: _storageBloc,
                  builder: (context, state) {
                    if (state is StorageFailure) {
                      return Center(
                        child: Text(state.error),
                      );
                    }

                    if (state is! StorageSuccess) {
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        child: const Center(
                          child: CircularProgressIndicator.adaptive(),
                        ),
                      );
                    }

                    PokemonDetailModel data = state.data;
                    return PokemonDetailItem(data: data);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
