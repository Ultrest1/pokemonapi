import 'package:flutter/material.dart';

import '../widgets/app_title.dart';
import '../widgets/pokemon_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            AppTitle(),
            Expanded(child: PokemonList()),
          ],
        ),
      ),
    );
  }
}
