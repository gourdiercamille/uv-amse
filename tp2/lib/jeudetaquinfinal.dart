import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercice5ter',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: ImageSlicer(),
    );
  }
}

class ImageSlicer extends StatefulWidget {
  @override
  _ImageSlicerState createState() => _ImageSlicerState();
}

class Tile {
  Image? image;
  Alignment alignment = Alignment(0, 0);

  Tile({this.image, this.alignment = const Alignment(0, 0)});

  Widget croppedImageTile(double sliderValue) {
    return FittedBox(
      fit: BoxFit.fill,
      child: ClipRect(
        child: Container(
          child: Align(
            alignment: this.alignment,
            widthFactor: 1 / sliderValue,
            heightFactor: 1 / sliderValue,
            child: this.image,
          ),
        ),
      ),
    );
  }
}

class _ImageSlicerState extends State<ImageSlicer> {
  late ImageProvider _image;
  late double _sliderValue;
  late List<Widget> _tiles;
  late int indexOfWhiteTile;

  @override
  void initState() {
    super.initState();

    // Load image from asset
    _image = AssetImage('assets/tiger.jpg');

    // Initialize slider value
    _sliderValue = 3;

    // Generate tiles
    _tiles = _generateTiles(_sliderValue.toDouble());

    // Delete a tile at random
    _tiles = deleteRandomTile( _tiles );

    indexOfWhiteTile = _tiles.length-1;
  }



    List<Widget> deleteRandomTile(List<Widget> tiles){
        Tile whiteTile = new Tile(
            image: Image.asset('assets/Carré_blanc.jpg'),
            alignment: Alignment(0,0));
        tiles.removeAt(_sliderValue.toInt()*_sliderValue.toInt()-1);
        tiles.add(createTileWidgetFrom(whiteTile));
        return tiles;
    }

    swapTilesDown() {
        setState(() {
            Widget temp = _tiles[indexOfWhiteTile];
            _tiles[indexOfWhiteTile] = _tiles[indexOfWhiteTile+_sliderValue.toInt()];
            _tiles[indexOfWhiteTile+_sliderValue.toInt()] = temp;
        });
        indexOfWhiteTile += _sliderValue.toInt();
    }

    swapTilesUp() {
        setState(() {
            _tiles.insert(indexOfWhiteTile, _tiles.removeAt(indexOfWhiteTile- _sliderValue.toInt()));
        });
        indexOfWhiteTile -= _sliderValue.toInt();
    }

    swapTilesLeft() {
        setState(() {
            Widget temp = _tiles[indexOfWhiteTile];
            _tiles[indexOfWhiteTile] = _tiles[indexOfWhiteTile-1];
            _tiles[indexOfWhiteTile-1] = temp;
        });
        indexOfWhiteTile -= 1;
    }

    swapTilesRight() {
        setState(() {
            Widget temp = _tiles[indexOfWhiteTile];
            _tiles[indexOfWhiteTile] = _tiles[indexOfWhiteTile+1];
            _tiles[indexOfWhiteTile+1] = temp;
        });
        indexOfWhiteTile += 1;
    }



    

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jeu de Taquin final'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.count(
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
              crossAxisCount: _sliderValue.toInt(),
              children: _tiles,
            ),
          ),
          Text('Size'),
          Slider(
            value: _sliderValue,
            min: 3,
            max: 8,
            divisions: 5,
            label: _sliderValue.toInt().toString(),
            onChanged: (double value) {
              setState(() {
                _sliderValue = value;
                _tiles = _generateTiles(_sliderValue.toDouble());
                _tiles = deleteRandomTile(_tiles);
              });
            },
          ),
        ],
        ),
        bottomNavigationBar: BottomAppBar(
            child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
                FloatingActionButton(
                    child: Icon(Icons.arrow_upward), onPressed: swapTilesUp),
                FloatingActionButton(
                    child: Icon(Icons.arrow_downward), onPressed: swapTilesDown),
                FloatingActionButton(
                    child: Icon(Icons.arrow_forward), onPressed: swapTilesRight),
                FloatingActionButton(
                    child: Icon(Icons.arrow_back), onPressed: swapTilesLeft),
            ],
            ),
        ),
    );
  }
  
  Widget createTileWidgetFrom(Tile tile) {
    return InkWell(
      child: tile.croppedImageTile(_sliderValue),
      onTap: () {
        print("tapped on tile");
      },
    );
  }



  List<Widget> _generateTiles(double sliderValue) {

    // Create list of tiles
    List<Widget> tiles = [];

    // Create cropped image tiles
        for (int i = 0; i < sliderValue; i++) {
          double valuei = i * (2.0 / (sliderValue - 1)) - 1.0;
          for (int j = 0; j < sliderValue; j++) {
            double valuej = j * (2.0 / (sliderValue - 1)) - 1.0;
            Tile tile = new Tile(image: Image.asset('assets/tiger.jpg'), alignment: Alignment(valuej, valuei));
            tiles.add(createTileWidgetFrom(tile));
            widthFactor: 2 /sliderValue;
            heightFactor: 2 /sliderValue;
            child: Image(
            image: _image,
            fit: BoxFit.cover);
            }
        }

    return tiles;
  }
}
