import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import 'package:pokemon_flutter/bloc/bloc/pokemon_berry_bloc.dart';

class PokemonBerryList extends StatefulWidget {
  const PokemonBerryList({
    super.key,
  });

  @override
  State<PokemonBerryList> createState() => _PokemonBerryListState();
}

class _PokemonBerryListState extends State<PokemonBerryList> {
  late PokemonBerryBloc _pokemonBerryBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pokemonBerryBloc = BlocProvider.of(context);
    _pokemonBerryBloc.add(BerryFetched());
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

      if (state is! PokemonBerrySuccess) {
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      }

      final data = state.listData;

      return (ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: data.length,
          itemBuilder: (context, index) {
            return (Image.network(data[index].imageUrl));
          }));
    }));
  }
}
