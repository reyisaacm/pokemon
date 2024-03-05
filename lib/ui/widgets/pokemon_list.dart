import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_flutter/bloc/pokemon/pokemon_bloc.dart';
import 'package:pokemon_flutter/models/pokemon_list_item_model.dart';
import 'package:pokemon_flutter/ui/widgets/pokemon_item.dart';

class PokemonList extends StatefulWidget {
  final List<PokemonListItemModel> listData;
  final String? search;

  const PokemonList({super.key, required this.listData, this.search});

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  final ScrollController _scrollController = ScrollController();
  final int limit = 30;
  int offset = 0;
  late PokemonBloc _pokemonBloc;

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
        _pokemonBloc.add(PokemonFetched(limit, offset, widget.search));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PokemonBloc, PokemonState>(
      listener: (context, state) {
        if (state is PokemonClear) {
          offset = 0;
        }
      },
      child: GridView.builder(
          controller: _scrollController,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4),
          itemCount: widget.listData.length,
          itemBuilder: ((context, index) {
            return GestureDetector(
              onTap: () {
                _pokemonBloc.add(PokemonSelected(widget.listData, index));
                // setState(() {
                //   isEnabled = true;
                // });
              },
              child: PokememonItem(
                  imageUrl: widget.listData[index].imageUrl,
                  id: widget.listData[index].id,
                  isSelected: widget.listData[index].isSelected),
            );
          })),
    );
  }
}
