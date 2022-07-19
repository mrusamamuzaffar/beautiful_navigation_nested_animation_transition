import 'package:flutter/material.dart';
import 'package:navigation_base_app/scenes.dart';

import 'grid.dart';

class DetailPage extends StatelessWidget {
  DetailPage({Key key, this.title, this.description, this.path})
      : super(key: key);

  static const DETAIL_PAGE = '/Detail Page';
  String title, path, description;
  Places places;

  @override
  Widget build(BuildContext context) {
    places =
        Places(placeTitle: title, placeSubTitle: description, placePath: path);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, CustomGridView.GRID_VIEW,
                    arguments: places);
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                child: Center(
                  child: Image(
                    image: AssetImage(path),
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            child: Container(
              margin: const EdgeInsets.all(10),
              child: Text(title, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
            ),
          ),
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Text(description +
                    'The South Island of New Zealand is renowned for its mountains, lakes and glaciers. The Southern Alps, home to 3,724m-high Aoraki Mt. Cook, run along the entire length of the island. In the southwest is Fiordland National Park, with steep-sided Milford Sound. In the north is Abel Tasman National Park, known for its trails and ocean kayaking. Queenstown is famed for adventure sports like bungee jumping and skiing. Google, London, the capital of England and the United Kingdom, is a 21st-century city with history stretching back to Roman times. At its centre stand the imposing Houses of Parliament, the iconic ‘Big Ben’ clock tower and Westminster Abbey, site of British monarch coronations. Across the Thames River, the London Eye observation wheel provides panoramic views of the South Bank cultural complex, and the entire city'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
