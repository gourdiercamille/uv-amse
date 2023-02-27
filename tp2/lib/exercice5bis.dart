import 'package:flutter/material.dart';

class Tile {
  Image? image;
  Alignment alignment = Alignment(0,0);

  Tile({this.image, this.alignment=const Alignment(0,0)});

  Widget croppedImageTile() {
    return FittedBox(
      fit: BoxFit.fill,
      child: ClipRect(
        child: Container(
          child: Align(
            alignment: this.alignment,
            widthFactor: 0.3,
            heightFactor: 0.3,
            child: this.image,
          ),
        ),
      ),
    );
  }
}

Tile tile1 = new Tile(
    image: Image.asset('assets/tiger.jpg'), alignment: Alignment(-1,-1));

Tile tile2 = new Tile(
    image: Image.asset('assets/tiger.jpg'), alignment: Alignment(0,-1));

Tile tile3 = new Tile(
    image: Image.asset('assets/tiger.jpg'), alignment: Alignment(1,-1));

Tile tile4 = new Tile(
    image: Image.asset('assets/tiger.jpg'), alignment: Alignment(-1,0));

Tile tile5 = new Tile(
    image: Image.asset('assets/tiger.jpg'), alignment: Alignment(0,0));

Tile tile6 = new Tile(
    image: Image.asset('assets/tiger.jpg'), alignment: Alignment(1,0));

Tile tile7 = new Tile(
    image: Image.asset('assets/tiger.jpg'), alignment: Alignment(-1,1));

Tile tile8 = new Tile(
    image: Image.asset('assets/tiger.jpg'), alignment: Alignment(0,1));

Tile tile9 = new Tile(
    image: Image.asset('assets/tiger.jpg'), alignment: Alignment(1,1));

class DisplayGridViewTileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Display a Cropped Image'),
            centerTitle: true,
        ),
        body: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 3,
            children: <Widget>[
            Container(
                padding: const EdgeInsets.all(8),
                color: Colors.teal[100],
                child: createTileWidgetFrom(tile1),
            ),
            Container(
                padding: const EdgeInsets.all(8),
                color: Colors.teal[200],
                child: createTileWidgetFrom(tile2),
            ),
            Container(
                padding: const EdgeInsets.all(8),
                color: Colors.teal[300],
                child: createTileWidgetFrom(tile3),
            ),
            Container(
                padding: const EdgeInsets.all(8),
                color: Colors.teal[400],
                child: createTileWidgetFrom(tile4),
            ),
            Container(
                padding: const EdgeInsets.all(8),
                color: Colors.teal[500],
                child: createTileWidgetFrom(tile5),
            ),
            Container(
                padding: const EdgeInsets.all(8),
                color: Colors.teal[600],
                child: createTileWidgetFrom(tile6),
            ),
            Container(
                padding: const EdgeInsets.all(8),
                color: Colors.teal[700],
                child: createTileWidgetFrom(tile7),
            ),
            Container(
                padding: const EdgeInsets.all(8),
                color: Colors.teal[800],
                child: createTileWidgetFrom(tile8),
            ),
            Container(
                padding: const EdgeInsets.all(8),
                color: Colors.teal[900],
                child: createTileWidgetFrom(tile9),
            )
            ]
        )
    );
  }
    Widget createTileWidgetFrom(Tile tile) {
    return InkWell(
      child: tile.croppedImageTile(),
      onTap: () {
        print("tapped on tile");
      },
    );
  }
}


