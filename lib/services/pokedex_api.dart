import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pokemonapi/model/PokemonModel.dart';

class PokeApi {
  static const String _url =
      "https://raw.githubusercontent.com/Biuni/PokemonGo-Pokedex/master/pokedex.json";

  static Future<List<PokemonModel>> getPokeData() async {
    List<PokemonModel> _list = [];

    var result = await Dio().get(_url);
    var pokeList = jsonDecode(result.data)['pokemon'];
    if (pokeList is List) {
      _list = pokeList.map((e) => PokemonModel.fromJson(e)).toList();
    } else {
      return [];
    }

    return _list;
  }
}
