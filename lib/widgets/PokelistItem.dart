import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokemonapi/contants/contants.dart';
import 'package:pokemonapi/model/PokemonModel.dart';
import 'package:pokemonapi/pages/detail_pages.dart';

import 'Poke_image_and_ball.dart';

class PokelistItem extends StatelessWidget {
  final PokemonModel pokemon;

  const PokelistItem({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailPage(pokemon: pokemon),
          ),
        );
      },
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.w),
          ),
          elevation: 3,
          shadowColor: Colors.white,
          color: Colors.red.withOpacity(0.8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                pokemon.name ?? 'N/A',
                style: Contants.getPokemonNameTextStyle(),
              ),
              Chip(
                label: Text(
                  pokemon.type![0],
                  style: Contants.gettypechiptextStyle(),
                ),
              ),
              Expanded(
                child: Pokeimageandbold(
                  pokemonModel: pokemon,
                ),
              ),
            ],
          )),
    );
  }
}
