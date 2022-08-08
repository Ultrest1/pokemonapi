import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemonapi/model/PokemonModel.dart';

class Pokeimageandbold extends StatelessWidget {
  final PokemonModel pokemonModel;
  Pokeimageandbold({Key? key, required this.pokemonModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topRight, //ayarla demek
          child: CachedNetworkImage(
            errorWidget: (context, url, error) => Icon(Icons.error),
            placeholder: (context, url) =>
                CircularProgressIndicator(), //netten veri gelene kadar
            imageUrl: pokemonModel.img ?? '',
          ),
        ),
      ],
    );
  }
}
