import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'pokemon.detail.dart';

class Pokemon {
  Pokemon(img, name) {
    this.img = img;
    this.name = name;
  }
  String img;
  String name;
}

class PokemonListView extends StatelessWidget {
  static final String route = 'pokemons';
  final List<Pokemon> pokemons = [
    new Pokemon(
        "http://www.serebii.net/pokemongo/pokemon/001.png", "Bulbasaur"),
    new Pokemon("http://www.serebii.net/pokemongo/pokemon/002.png", "Ivysaur"),
    new Pokemon("http://www.serebii.net/pokemongo/pokemon/003.png", "Venusaur"),
    new Pokemon(
        "http://www.serebii.net/pokemongo/pokemon/004.png", "Charmander"),
    new Pokemon(
        "http://www.serebii.net/pokemongo/pokemon/005.png", "Charmeleon"),
    new Pokemon(
        "http://www.serebii.net/pokemongo/pokemon/006.png", "Charizard"),
    new Pokemon("http://www.serebii.net/pokemongo/pokemon/007.png", "Squirtle"),
    new Pokemon(
        "http://www.serebii.net/pokemongo/pokemon/008.png", "Wartortle"),
    new Pokemon(
        "http://www.serebii.net/pokemongo/pokemon/009.png", "Blastoise"),
    new Pokemon("http://www.serebii.net/pokemongo/pokemon/010.png", "Caterpie"),
    new Pokemon("http://www.serebii.net/pokemongo/pokemon/011.png", "Metapod"),
    new Pokemon(
        "http://www.serebii.net/pokemongo/pokemon/012.png", "Butterfree"),
  ];

  List<Widget> _getList(BuildContext context) {
    List<Widget> list = [];
    pokemons.forEach((pokemon) {
      final hero = Hero(
          tag: pokemon.img,
          child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              elevation: 3.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    height: 100.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(pokemon.img),
                      ),
                    ),
                  ),
                  Text(
                    pokemon.name,
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ],
              )));
      final inkWell = InkWell(
          child: hero,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PokeDetail(
                  pokemon: pokemon,
                ),
              ),
            );
          });

      list.add(inkWell);
    });
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Pokemons"),
        ),
        body: GridView.count(
          children: _getList(context),
          crossAxisCount: 2,
        ));
  }
}
