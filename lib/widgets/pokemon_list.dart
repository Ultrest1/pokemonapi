import 'package:flutter/material.dart';

import '../model/PokemonModel.dart';
import '../services/pokedex_api.dart';
import 'PokelistItem.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({Key? key}) : super(key: key);

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  late Future<List<PokemonModel>> _pokemonList;

  @override
  void initState() {
    _pokemonList = PokeApi.getPokeData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PokemonModel>>(
      future: _pokemonList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<PokemonModel> _listem = snapshot.data!;

          return GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: _listem.length,
            itemBuilder: (context, index) {
              var oanKiPokemon = _listem[index];
              return PokelistItem(pokemon: oanKiPokemon);
            },
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text("veri gelmedi"),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
