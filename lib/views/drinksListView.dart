import 'package:flutter/material.dart';

class Drink {
  Drink(int id, String image, String title) {
    this.id = id;
    this.image = image;
    this.title = title;
  }
  String image;
  String title;
  int id;
}

class DrinksListView extends StatelessWidget {
  static final String route = 'drinks';

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: ListView(
          children: _getList(context),
        ));
  }

  final List<Drink> _drinksList = [
    new Drink(
        15300,
        "https:\/\/www.thecocktaildb.com\/images\/media\/drink\/rrtssw1472668972.jpg",
        "3-Mile Long Island Iced Tea"),
    new Drink(
        13581,
        "https:\/\/www.thecocktaildb.com\/images\/media\/drink\/xtuyqv1472669026.jpg",
        "410 Gone"),
    new Drink(
        14598,
        "https:\/\/www.thecocktaildb.com\/images\/media\/drink\/wwpyvr1461919316.jpg",
        "50\/50"),
    new Drink(
        17105,
        "https:\/\/www.thecocktaildb.com\/images\/media\/drink\/ywxwqs1461867097.jpg",
        "501 Blue"),
    new Drink(
        14598,
        "https:\/\/www.thecocktaildb.com\/images\/media\/drink\/wwpyvr1461919316.jpg",
        "50\/50"),
  ];

  List<Widget> _getList(BuildContext context) {
    List<Widget> list = [];
    _drinksList.forEach((item) {
      final imageCard = Image.network(
        item.image,
        alignment: FractionalOffset.topCenter,
        fit: BoxFit.fitWidth,
      );

      final textWithBackgroud = Container(
          color: Colors.black54,
          child: Padding(
            padding: EdgeInsets.all(30),
            child: Text(
              item.title,
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
          ));
      final textPositioned = Positioned(
          bottom: 0,
          left: 0,
          width: MediaQuery.of(context).size.width,
          child: textWithBackgroud);

      list.add(Card(
        child: Stack(
          fit: StackFit.passthrough,
          children: <Widget>[imageCard, textPositioned],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        margin: EdgeInsets.all(10),
        elevation: 5,
        clipBehavior: Clip.antiAliasWithSaveLayer,
      ));
    });
    return list;
  }
}
