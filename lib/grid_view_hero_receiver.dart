import 'package:flutter/material.dart';
import 'package:navigation_base_app/last.dart';

class GridViewHeroReceiver extends StatelessWidget {

   GridViewHeroReceiver({Key key, this.index, this.path}) : super(key: key);

   static const  GridView_Hero_Receiver = '/GridViewHeroReceiver';
  final index;
  String path;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Title'),
      ),
      body: Column(
        children: [
        Align(
          alignment: Alignment.center,
          child: Material(
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Hero(
                tag: MyHeroAnimation.MY_HERO_ANIMATION_SECOND_TAG+index.toString(),
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage(path),
                ),
              ),
            ),
          ),
        ),]
      )
    );
  }
}