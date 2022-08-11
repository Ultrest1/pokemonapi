import 'package:bubble_lens/bubble_lens.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../model/PokemonModel.dart';
import '../services/pokedex_api.dart';

class bubble extends StatefulWidget {
  const bubble({Key? key}) : super(key: key);

  @override
  State<bubble> createState() => _bubbleState();
}

class _bubbleState extends State<bubble> {
  late Future<List<PokemonModel>> _pokemonList;

  @override
  void initState() {
    _pokemonList = PokeApi.getPokeData();
    super.initState();
    print(_pokemonList.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.withOpacity(0.8),
      body: FutureBuilder<List<PokemonModel>>(
        future: _pokemonList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<PokemonModel> _listem1 = snapshot.data!;

            return BubbleLens(
                size: 100,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                widgets: [
                  for (var i = 0; i < _listem1.length; i++)
                    Card(
                      color: Colors.transparent,
                      elevation: 0,
                      child: Column(
                        children: [
                          Expanded(
                            child: CachedNetworkImage(
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                              placeholder: (context, url) =>
                                  CircularProgressIndicator(), //netten veri gelene kadar
                              imageUrl: _listem1[i].img ?? '',
                            ),
                          ),
                          Text("${_listem1[i]}")
                        ],
                      ),
                    ),
                ]);
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
      ),
    );
  }
}
