import "dart:async";

import "package:flutter/material.dart";

class PokemonSearch extends StatefulWidget {
  final ValueChanged<String> onChangedCallback;
  const PokemonSearch({
    super.key,
    required this.onChangedCallback,
  });

  @override
  State<PokemonSearch> createState() => _PokemonSearchState();
}

class _PokemonSearchState extends State<PokemonSearch> {
  Timer? _timer;

  @override
  Widget build(BuildContext context) {
    return TextField(
      // readOnly: isTextFieldReadOnly,
      onChanged: (String value) {
        if (_timer?.isActive ?? false) _timer?.cancel();
        _timer = Timer(const Duration(milliseconds: 500), () {
          widget.onChangedCallback(value);
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
    );
  }
}
