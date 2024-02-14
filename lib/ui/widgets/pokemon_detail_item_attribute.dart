import "package:flutter/material.dart";

class PokemonDetailItemAttribute extends StatelessWidget {
  final String name;
  final String value;
  final double fontSize = 18;

  const PokemonDetailItemAttribute({
    super.key,
    required this.name,
    required this.value,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: TextStyle(fontSize: fontSize),
          ),
          SizedBox(
            width: 45,
            child: Row(
              children: [
                const Text(": "),
                Text(
                  value,
                  style: TextStyle(fontSize: fontSize),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
