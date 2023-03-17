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
    late List<Tile> _tiles;
    late List<Tile> _tilesToWin;
    late int indexOfWhiteTile;
    late int nbMoves;
    String? endShuffle;

    @override
    void initState() {
        super.initState();

        // Load image from asset
        _image = AssetImage('assets/tiger.jpg');

        // Initialize slider value
        _sliderValue = 3;

        // Initialize indexOfWhiteTile
        indexOfWhiteTile = 8;

        // Initialize nbMoves
        nbMoves = 100;

        // Generate tiles
        _tiles = _generateTiles(_sliderValue.toDouble());

        // Delete a tile at random
        _tiles = deleteLastTile( _tiles );

        //Create a copy of the solution (which is the game state at the beginning)
        _tilesToWin = _generateTiles(_sliderValue.toDouble());

        //Shuffle the game (100 moves)
        //_tiles = shuffleGame(nbMoves);

        //is not NULL anymore only when shuffle is over
        endShuffle = "finito";

    }

    List<Tile> deleteLastTile(List<Tile> tiles){
        int pos = tiles.length-1;
        Tile whiteTile = new Tile(
            image: Image.asset('assets/Carré_blanc.jpg'),
            alignment: Alignment(0,0));
        tiles.removeAt(pos);
        tiles.add(whiteTile);
        return tiles;
    }


    swapWithBlankTileIndex(int tileToMoveIndex) {
        Tile oldTile = _tiles[tileToMoveIndex];
        _tiles[tileToMoveIndex] = _tiles[indexOfWhiteTile];
        _tiles[indexOfWhiteTile] = oldTile;
        indexOfWhiteTile = tileToMoveIndex;
    }

    swapTileFromDown() {
        if(indexOfWhiteTile>=_sliderValue.toInt())
            setState(() {
                swapWithBlankTileIndex(indexOfWhiteTile-_sliderValue.toInt());
                if(endShuffle != null) {
                  int j=0;
                  for (int i = 0; i<=_tiles.length; i++) {
                    if (_tiles[i] == _tilesToWin[i]) {
                      j+=1;
                      if (j == _tiles.length) {
                        EndOfGame(context);
                      }
                    }
                  }
                }
            }
            );
        else {
          print("cannot move up!!!");
        }
    }
    
    swapTileFromUp() {
        if(indexOfWhiteTile<=(_sliderValue.toInt()*(_sliderValue.toInt()-1)))
            setState(() {
                swapWithBlankTileIndex(indexOfWhiteTile+_sliderValue.toInt());
                if(endShuffle != null) {
                  int j=0;
                  for (int i = 0; i<=_tiles.length; i++) {
                    if (_tiles[i] == _tilesToWin[i]) {
                      j+=1;
                      if (j == _tiles.length) {
                        EndOfGame(context);
                      }
                    }
                  }
                }
            }
            );
        else {
          print("cannot move down!!!");
        }
    }

    swapTileFromLeft() {
        if((indexOfWhiteTile%_sliderValue.toInt())!=(_sliderValue.toInt()-1))
            setState(() {
                swapWithBlankTileIndex(indexOfWhiteTile+1);
                if(endShuffle != null) {
                  int j=0;
                  for (int i = 0; i<=_tiles.length; i++) {
                    if (_tiles[i] == _tilesToWin[i]) {
                      j+=1;
                      if (j == _tiles.length) {
                        EndOfGame(context);
                      }
                    }
                  }
                }
            }
            );
        else {
          print("cannot move right!!!");
        }
    }

    swapTileFromRight() {
        if((indexOfWhiteTile%_sliderValue.toInt())!=0)
            setState(() {
                swapWithBlankTileIndex(indexOfWhiteTile-1);
                if(endShuffle != null) {
                  int j=0;
                  for (int i = 0; i<=_tiles.length; i++) {
                    if (_tiles[i] == _tilesToWin[i]) {
                      j+=1;
                      if (j == _tiles.length) {
                        EndOfGame(context);
                      }
                    }
                  }
                }
            }
            );
        else {
          print("cannot move left!!!");
        }
    }

    /*shuffleGame(int nbMoves) {
      for (int i = 1; i <= nbMoves; i++) {
        int randomInt = Random().nextInt(4) + 1;
          if (randomInt == 1) {
            swapTileFromDown();
            break;
          }
          if (randomInt == 2) {
            swapTileFromUp();
            break;
          }
          if (randomInt == 3) {
            swapTileFromLeft();
            break;
          }
          if (randomInt == 4) {
            swapTileFromRight();
            break;
          }
      }
    }
    */

    void EndOfGame(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Bravo !'),
            content: Text('Tu as remporté la partie'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Fermer'),
              ),
            ],
          );
        },
      );
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
              children:
                List<Widget>.generate(
                    _tiles.length,
                    (i) => createTileWidgetFrom( _tiles[i] )
                ),
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
                _tiles = deleteLastTile(_tiles);
                _tilesToWin = _generateTiles(_sliderValue.toDouble());
                //_tiles = shuffleGame(nbMoves);
                indexOfWhiteTile = _tiles.length-1;
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
                    heroTag: "btnleft",
                    child: Icon(Icons.arrow_back), onPressed: swapTileFromLeft()),
                FloatingActionButton(
                    heroTag: "btnup",
                    child: Icon(Icons.arrow_upward), onPressed: swapTileFromUp()),
                FloatingActionButton(
                    heroTag: "btnright",
                    child: Icon(Icons.arrow_forward), onPressed: swapTileFromRight()),
                FloatingActionButton(
                    heroTag: "btndown",
                    child: Icon(Icons.arrow_downward), onPressed: swapTileFromDown()),
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

  List<Tile> _generateTiles(double sliderValue) {

    // Create list of tiles
    List<Tile> tiles = [];

    // Create cropped image tiles
        for (int i = 0; i < sliderValue; i++) {
            double valuei = i * (2.0 / (sliderValue - 1)) - 1.0;
            for (int j = 0; j < sliderValue; j++) {
                double valuej = j * (2.0 / (sliderValue - 1)) - 1.0;
                Tile tile = new Tile(image: Image.asset('assets/tiger.jpg'), alignment: Alignment(valuej, valuei));
                tiles.add(tile);
            }
        }


    return tiles;
  }
}
