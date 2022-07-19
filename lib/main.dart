import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:navigation_base_app/detail.dart';
import 'package:navigation_base_app/grid.dart';
import 'package:navigation_base_app/hero.dart';
import 'package:navigation_base_app/last.dart';
import 'package:navigation_base_app/scenes.dart';

import 'grid_view_hero_receiver.dart';

const seconds = 2;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      onGenerateRoute: (settings) {
        if (settings.name == MyHomePage.MY_HOME_PAGE) {
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                MyHomePage(),
            transitionDuration: const Duration(seconds: seconds),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              var begin = Offset(0.0, 1.0);
              var end = Offset.zero;
              var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: Curves.bounceIn));
              var offsetAnimation = animation.drive(tween);
              return FadeTransition(
                opacity: animation,
                child: SlideTransition(
                  position: offsetAnimation,
                  child: child,
                ),
              );
            },
          );
        } else if (settings.name == DetailPage.DETAIL_PAGE) {
          Places places = settings.arguments;
          return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  DetailPage(
                    title: places.placeTitle,
                    description: places.placeSubTitle,
                    path: places.placePath,
                  ),
              reverseTransitionDuration: const Duration(seconds: seconds),
              transitionDuration: const Duration(seconds: seconds),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                var begin = Offset(-1.0, 1.0);
                var end = Offset.zero;
                var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: Curves.bounceInOut));
                var offsetAnimation = animation.drive(tween);
                return FadeTransition(
                  opacity: animation,
                  child: ScaleTransition(
                    scale: animation,
                    child: SlideTransition(
                      position: offsetAnimation,
                      child: child,
                    ),
                  ),
                );
              });
        } else if(settings.name == CustomGridView.GRID_VIEW) {
          Places places = settings.arguments;
          return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  CustomGridView(title: places.placeTitle, path: places.placePath,),
              reverseTransitionDuration: const Duration(seconds: seconds),
              transitionDuration: const Duration(seconds: seconds),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                var begin = Offset(1.0, 1.0);
                var end = Offset.zero;
                var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: Curves.bounceInOut));
                var offsetAnimation = animation.drive(tween);
                return RotationTransition(
                  turns: animation,
                  child: ScaleTransition(
                    scale: animation,
                    child: SlideTransition(
                      position: offsetAnimation,
                      child: child,
                    ),
                  ),
                );
              });
        }
        else if(settings.name == TagHero.TAG_HERO_CLASS) {
          Places places = settings.arguments;
          return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  TagHero(title: places.placeTitle, path: places.placePath,),
            transitionDuration: const Duration(seconds: seconds),
              reverseTransitionDuration: const Duration(seconds: seconds),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                var begin = Offset(0.0, -1.0);
                var end = Offset.zero;
                var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: Curves.elasticInOut));
                var offsetAnimation = animation.drive(tween);
                return FadeTransition(
                  opacity: animation,
                  child: SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  ),
                );
              }
          );
        }
        else if(settings.name == MyHeroAnimation.MY_HERO_ANIMATION_TAG) {
          Places places = settings.arguments;
          return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  MyHeroAnimation(title: places.placeTitle, path: places.placePath,),
              transitionDuration: const Duration(seconds: seconds),
              reverseTransitionDuration: const Duration(seconds: seconds),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                var begin = Offset(1.0, 0.0);
                var end = Offset.zero;
                var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: Curves.elasticInOut));
                var offsetAnimation = animation.drive(tween);
                return FadeTransition(
                  opacity: animation,
                  child: SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  ),
                );
              }
          );
        }
        else {
          Places places = settings.arguments;
          return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  GridViewHeroReceiver(index: places.index, path: places.placePath,),
              transitionDuration: const Duration(seconds: seconds),
              reverseTransitionDuration: const Duration(seconds: seconds),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                var begin = Offset(1.0, 0.0);
                var end = Offset.zero;
                var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: Curves.bounceIn));
                var offsetAnimation = animation.drive(tween);
                return FadeTransition(
                  opacity: animation,
                  child: SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  ),
                );
              }
          );
        }
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  static const MY_HOME_PAGE = '//';

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Places> placesList = <Places>[];

  void addPlaces() {
    placesList.add(Places(
      placeTitle: 'South Island',
      placeSubTitle: 'New Zealand',
      placePath: 'assets/New_Zealand_South_Island_one.png',
    ));
    placesList.add(Places(
      placeTitle: 'Bora Bora',
      placeSubTitle: 'Island West',
      placePath: 'assets/bora_bora.jpg',
    ));
    placesList.add(Places(
      placeTitle: 'London',
      placeSubTitle: 'New London East',
      placePath: 'assets/London.jpg',
    ));
    placesList.add(Places(
      placeTitle: 'Maui',
      placeSubTitle: 'New Maui North',
      placePath: 'assets/maui.jpg',
    ));
    placesList.add(Places(
      placeTitle: 'Paris One',
      placeSubTitle: 'In Paris West',
      placePath: 'assets/Paris_one.jpg',
    ));
    placesList.add(Places(
      placeTitle: 'Phuket',
      placeSubTitle: 'In Phuket East',
      placePath: 'assets/phuket.jpg',
    ));
    placesList.add(Places(
      placeTitle: 'Phuket Home',
      placeSubTitle: 'In Phuket Home',
      placePath: 'assets/phuket_home.jpg',
    ));
    placesList.add(Places(
      placeTitle: 'Rome',
      placeSubTitle: 'West Rome',
      placePath: 'assets/rome.jpg',
    ));
    placesList.add(Places(
      placeTitle: 'Tahiti',
      placeSubTitle: 'East Tahiti',
      placePath: 'assets/tahiti.jpg',
    ));
    placesList.add(Places(
      placeTitle: 'Turki',
      placeSubTitle: 'In Turki East',
      placePath: 'assets/turki.jpg',
    ));
    placesList.add(Places(
      placeTitle: 'South Island',
      placeSubTitle: 'New Zealand',
      placePath: 'assets/New_Zealand_South_Island_one.png',
    ));
    placesList.add(Places(
      placeTitle: 'Bora Bora',
      placeSubTitle: 'Island West',
      placePath: 'assets/bora_bora.jpg',
    ));
    placesList.add(Places(
      placeTitle: 'London',
      placeSubTitle: 'New London East',
      placePath: 'assets/London.jpg',
    ));
    placesList.add(Places(
      placeTitle: 'Maui',
      placeSubTitle: 'New Maui North',
      placePath: 'assets/maui.jpg',
    ));
    placesList.add(Places(
      placeTitle: 'Paris One',
      placeSubTitle: 'In Paris West',
      placePath: 'assets/Paris_one.jpg',
    ));
    placesList.add(Places(
      placeTitle: 'Phuket',
      placeSubTitle: 'In Phuket East',
      placePath: 'assets/phuket.jpg',
    ));
    placesList.add(Places(
      placeTitle: 'Phuket Home',
      placeSubTitle: 'In Phuket Home',
      placePath: 'assets/phuket_home.jpg',
    ));
    placesList.add(Places(
      placeTitle: 'Rome',
      placeSubTitle: 'West Rome',
      placePath: 'assets/rome.jpg',
    ));
    placesList.add(Places(
      placeTitle: 'Tahiti',
      placeSubTitle: 'East Tahiti',
      placePath: 'assets/tahiti.jpg',
    ));
    placesList.add(Places(
      placeTitle: 'Turki',
      placeSubTitle: 'In Turki East',
      placePath: 'assets/turki.jpg',
    ));
  }

  @override
  Widget build(BuildContext context) {
    addPlaces();
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(placesList.elementAt(1).placePath),
          ),
          title: Text('Best Places', style: TextStyle(color: Colors.white),),
          subtitle: Text('Best Places in the world', style: TextStyle(color: Colors.white),),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.menu),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.add),
          )
        ],
      ),
      body: Center(
        child: ListView.builder(
          itemCount: 20,
          padding: const EdgeInsets.all(5),
          itemBuilder: (context, index) {
            return Neumorphic(
              margin: const EdgeInsets.all(5),
              style: NeumorphicStyle(
                  shape: NeumorphicShape.flat,
                  boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                  depth: 20,
                  // lightSource: LightSource.topLeft,
                  intensity: 1,
                  surfaceIntensity: 1,
                  color: Colors.white),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, DetailPage.DETAIL_PAGE,
                      arguments: placesList.elementAt(index));
                },
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage(placesList.elementAt(index).placePath),
                  ),
                  title: Text(placesList.elementAt(index).placeTitle),
                  subtitle: Text(placesList.elementAt(index).placeSubTitle),
                  trailing: Icon(Icons.forward_outlined),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
