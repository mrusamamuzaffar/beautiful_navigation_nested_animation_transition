import 'package:flutter/material.dart';
import 'package:navigation_base_app/hero.dart';
import 'package:navigation_base_app/scenes.dart';

class CustomGridView extends StatelessWidget {
  CustomGridView({Key key, this.title, this.path}) : super(key: key);

  static const GRID_VIEW = '/GridPage';
  String path, title;
  Places places;

  @override
  Widget build(BuildContext context) {
    places = Places(placeTitle: title, placePath: path);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: GridView.count(
          crossAxisCount: 2,
          children: List.generate(
            30,
            (index) => Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Container(
                child: InkWell(
                  child: Image(
                    image: AssetImage(path),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, TagHero.TAG_HERO_CLASS,
                        arguments: places);
                  },
                ),
              ),
            ),
          )),
    );
  }
}
