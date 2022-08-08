import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemonapi/model/PokemonModel.dart';

import '../widgets/Poke_type_name.dart';

class DetailPage extends StatelessWidget {
  final PokemonModel pokemon;
  const DetailPage({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent.shade400,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back_ios),
            ),
            pokeTypeName(
              pokemon: pokemon,
            ),
            Expanded(
              child: CachedNetworkImage(
                alignment: Alignment.center,
                errorWidget: (context, url, error) => Icon(Icons.error),
                placeholder: (context, url) =>
                    CircularProgressIndicator(), //netten veri gelene kadar
                imageUrl: pokemon.img ?? '',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
