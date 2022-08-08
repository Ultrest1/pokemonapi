import 'package:flutter/material.dart';
import 'package:pokemonapi/contants/contants.dart';
import 'package:pokemonapi/model/PokemonModel.dart';

class pokeTypeName extends StatelessWidget {
  final PokemonModel pokemon;
  const pokeTypeName({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              pokemon.name ?? 'N/A',
              style: Contants.getPokemonNameTextStyle(),
            ),
            Text(
              '#${pokemon.num}',
              style: Contants.getPokemonNameTextStyle(),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Chip(label: Text(pokemon.type?.join(' + ') ?? 'null')),
      ],
    );
  }
}
