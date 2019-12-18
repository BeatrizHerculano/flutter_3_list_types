import 'package:flutter/material.dart';

import 'views/drinksListView.dart';
import 'views/pokemonListView.dart';
import 'views/spotifyListView.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(title: 'Listas Lindas'),
        'drinks': (context) => DrinksListView(),
        'pokemons': (context) => PokemonListView(),
        'spotify': (context) => SpotifyListView(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              color: Colors.cyan,
              elevation: 5,
              child: Text('Lista de Drinks'),
              onPressed: _navigate(DrinksListView.route),
            ),
            RaisedButton(
              color: Colors.amber,
              elevation: 5,
              child: Text('Lista de Pokemons'),
              onPressed: _navigate(PokemonListView.route),
            ),
            RaisedButton(
              color: Colors.indigoAccent,
              child: Text('Lista Spotify'),
              onPressed: _navigate(SpotifyListView.route),
            ),
          ],
        ),
      ),
    );
  }

  void Function() _navigate(String routeName) =>
      () => Navigator.of(context).pushNamed(routeName);
}
