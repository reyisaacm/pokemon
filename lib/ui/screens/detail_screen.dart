import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:pokemon_flutter/bloc/pokemon_detail/pokemon_detail_bloc.dart";
import "package:pokemon_flutter/bloc/storage/storage_bloc.dart";
import "package:pokemon_flutter/models/pokemon_detail_model.dart";

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
    // TODO: implement initState
    super.initState();
    _storageBloc = context.read<StorageBloc>();
    _storageBloc.add(StorageLoaded());
    _pokemonDetailBloc = context.read<PokemonDetailBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pokemon Detail")),
      body: Column(
        children: [
          BlocBuilder<StorageBloc, StorageState>(
              bloc: _storageBloc,
              builder: (context, state) {
                if (state is StorageInitial) {
                  _pokemonDetailBloc.add(PokemonDetailFetched(widget.id));
                }

                if (state is StorageFailure) {
                  return Center(
                    child: Text(state.error),
                  );
                }

                if (state is! StorageSuccess) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }

                PokemonDetailModel data = state.data;
                return Column(
                  children: [Image.network(data.imageUrl)],
                );
              })
        ],
      ),
    );
  }
}
