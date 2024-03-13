import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:pokemon_flutter/ui/widgets/pokemon_image.dart";

class PokememonItem extends StatelessWidget {
  final String imageUrl;
  final int id;
  final bool isSelected;

  const PokememonItem(
      {super.key,
      required this.imageUrl,
      required this.id,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            color: isSelected ? Theme.of(context).colorScheme.secondary : null,
            // child: imageUrl == ""
            //     ? Image.asset("assets/images/pokemon-icon.png")
            //     : Image.network(
            //         imageUrl,
            //         loadingBuilder: (context, child, loadingProgress) {
            //           if (loadingProgress == null) return child;
            //           return Padding(
            //             padding: const EdgeInsets.symmetric(
            //                 vertical: 24.0, horizontal: 16),
            //             child: CircularProgressIndicator.adaptive(
            //               value: loadingProgress.expectedTotalBytes != null
            //                   ? loadingProgress.cumulativeBytesLoaded /
            //                       loadingProgress.expectedTotalBytes!
            //                   : null,
            //             ),
            //           );
            //         },
            //       ),
            child: PokemonImage(
              imageUrl: imageUrl,
            ))
      ],
    );
  }
}
