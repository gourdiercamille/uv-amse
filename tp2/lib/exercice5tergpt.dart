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

class SliderApp extends StatelessWidget {
    const SliderApp({super.key});

    @override
    Widget build(BuildContext context) {
    return const MaterialApp(
    home: SliderExample(),
    );
}
}

class SliderExample extends StatefulWidget {
    const SliderExample({super.key});

    @override
    State<SliderExample> createState() => _SliderExampleState();
}

class DisplayGridViewTileWidget extends StatefulWidget {
  const DisplayGridViewTileWidget({Key? key}) : super(key: key);

  @override
  _DisplayGridViewTileWidgetState createState() =>
      _DisplayGridViewTileWidgetState();
}

class _DisplayGridViewTileWidgetState extends State<DisplayGridViewTileWidget> {
  double _currentSliderValue = 3;
  late List<Tile> _tiles;

  @override
  void initState() {
    super.initState();
    _tiles = constructTiles(_currentSliderValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Display a Cropped Image'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: _currentSliderValue.toInt(),
              children: List.generate(
                _currentSliderValue.toInt() * _currentSliderValue.toInt(),
                (index) {
                  return Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[100 + index * 100],
                    child: createTileWidgetFrom(_tiles[index]),
                  );
                },
              ),
            ),
          ),
          Slider(
            value: _currentSliderValue,
            label: _currentSliderValue.round().toString(),
            min: 3,
            max: 7,
            divisions: 4,
            onChanged: (double value) {
              setState(() {
                _currentSliderValue = value;
                _tiles = constructTiles(_currentSliderValue);
              });
            },
          ),
        ],
      ),
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

  List<Tile> constructTiles(double value) {
    List<Tile> tiles = [];
    double decoupage = 0;

    if (value == 3) {
      decoupage = 1;
    }
    if (value == 4) {
      decoupage = 2 / 3;
    }
    if (value == 5) {
      decoupage = 1 / 2;
    }
    if (value == 6) {
      decoupage = 0.4;
    }
    if (value == 7) {
      decoupage = 1 / 3;
    }
    }

    Widget createTileWidgetFrom(Tile tile) {
    return InkWell(
      child: tile.croppedImageTile(),
      onTap: () {
        print("tapped on tile");
      },
    );
    runApp(const SliderApp());
  }







