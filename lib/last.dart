import 'package:flutter/material.dart';
import 'package:navigation_base_app/grid_view_hero_receiver.dart';
import 'package:navigation_base_app/hero.dart';
import 'package:navigation_base_app/scenes.dart';

class MyHeroAnimation extends StatelessWidget {
   MyHeroAnimation({Key key, this.title, this.path}) : super(key: key);

  final path, title;
  Places places;
  static const MY_HERO_ANIMATION_TAG = '/hero_animation_tag';
  static String MY_HERO_ANIMATION_SECOND_TAG = '/hero_animation_second_tag';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          children: [
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: Material(
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Hero(
                    tag: TagHero.HERO_TAG,
                    child: CircleAvatar(
                      radius: 100,
                      backgroundImage: AssetImage(path),
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 5,
              fit: FlexFit.tight,
              child: GridView.count(
                crossAxisCount: 4,
                children: List.generate(
                    20,
                    (index) => Material(
                          child: InkWell(
                            /*onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return Dialog(
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Container(
                                        height: 200,
                                        width: 200,
                                        child: Material(
                                          child: Hero(
                                            tag: MY_HERO_ANIMATION_SECOND_TAG +
                                                index.toString(),
                                            child: Image(
                                              image: AssetImage(path),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },*/
                            onTap: () {
                              places = Places(index: index, placePath: path);
                              Navigator.pushNamed(context, GridViewHeroReceiver.GridView_Hero_Receiver, arguments: places);
                            },
                            child: Hero(
                              tag: MY_HERO_ANIMATION_SECOND_TAG +
                                  index.toString(),
                              child: CircleAvatar(
                                backgroundImage: AssetImage(path),
                              ),
                              flightShuttleBuilder: (flightContext,
                                  animation,
                                  flightDirection,
                                  fromHeroContext,
                                  toHeroContext) {
                                final Hero hero = toHeroContext.widget;
                                return ScaleTransition(
                                  scale: animation,
                                  child: FadeTransition(
                                    opacity: animation,
                                    child: hero,
                                  ),
                                );
                              },
                            ),
                          ),
                        )),
              ),
            )
          ],
        )
    );
  }
}