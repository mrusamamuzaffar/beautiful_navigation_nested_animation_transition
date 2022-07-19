import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navigation_base_app/grid.dart';
import 'package:navigation_base_app/last.dart';
import 'package:navigation_base_app/scenes.dart';

class TagHero extends StatelessWidget {
  TagHero({Key key, this.title, this.path}) : super(key: key);

  static const TAG_HERO_CLASS = '/TAG_HERO_CLASS';
  String title, path;
  static const HERO_TAG = 'TAG';
  Places places;

  @override
  Widget build(BuildContext context) {
    places = Places(placeTitle: title, placePath: path);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            fit: FlexFit.tight,
            flex: 3,
            child: InkWell(
            child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)),
            child: Hero(
              tag: TagHero.HERO_TAG,
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage(path),
              ),
              flightShuttleBuilder: (flightContext, animation, flightDirection, fromHeroContext, toHeroContext) {
                final Hero hero = toHeroContext.widget;
                return RotationTransition(turns: animation, child: hero,);
              },
            ),
            ),
            onTap: () {
            Navigator.pushNamed(context, MyHeroAnimation.MY_HERO_ANIMATION_TAG, arguments: places);
            },
            ),
          ),
          Flexible(child: Text('Usama'))
        ],
      ),
    );
  }
}
