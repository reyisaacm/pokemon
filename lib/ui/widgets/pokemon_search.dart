import "dart:async";

import "package:flutter/material.dart";

class PokemonSearch extends StatefulWidget {
  final ValueChanged<String> onChangedCallback;
  final bool isReadOnly;
  const PokemonSearch({
    super.key,
    required this.onChangedCallback,
    required this.isReadOnly,
  });

  @override
  State<PokemonSearch> createState() => _PokemonSearchState();
}

class _PokemonSearchState extends State<PokemonSearch> {
  Timer? _timer;
  late bool _isReadOnly;

  @override
  Widget build(BuildContext context) {
    _isReadOnly = widget.isReadOnly;
    final Color fillColor =
        _isReadOnly ? Colors.grey[300]! : Theme.of(context).colorScheme.primary;

    return TextField(
      readOnly: widget.isReadOnly,
      onChanged: (String value) {
        if (_timer?.isActive ?? false) _timer?.cancel();
        _timer = Timer(const Duration(milliseconds: 500), () {
          widget.onChangedCallback(value);
        });
      },
      decoration: InputDecoration(
        hintText: "Search Pokemon",
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: fillColor),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: fillColor),
          borderRadius: BorderRadius.circular(10.0),
        ),
        fillColor: fillColor,
        filled: widget.isReadOnly ? true : false,
      ),
    );
  }
}
