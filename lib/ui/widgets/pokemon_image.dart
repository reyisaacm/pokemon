import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PokemonImage extends StatelessWidget {
  final String imageUrl;
  const PokemonImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return imageUrl == ""
        ? Image.asset("assets/images/pokemon-icon.png")
        : Image(
            image: CachedNetworkImageProvider(imageUrl),
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16),
                child: CircularProgressIndicator.adaptive(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            },
          );
  }
}
