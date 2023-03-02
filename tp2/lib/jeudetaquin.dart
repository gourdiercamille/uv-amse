import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(TaquinApp());
}

class TaquinApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Taquin',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TaquinHomePage(title: 'Taquin'),
    );
  }
}

class TaquinHomePage extends StatefulWidget {
  TaquinHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _TaquinHomePageState createState() => _TaquinHomePageState();
}

class _TaquinHomePageState extends State<TaquinHomePage> {
  int _gridSize = 3; // default grid size
  late List<int> _tiles; // list of tile numbers
  late List<Widget> _tileWidgets; // list of tile widgets
  Random _random = Random();

  @override
  void initState() {
    super.initState();
    _initGame();
  }

  // initialize the game board with random tile positions
  void _initGame() {
    _tiles = List.generate(_gridSize * _gridSize, (index) => index);
    _tiles.shuffle(_random);
    _tileWidgets = List.generate(_gridSize * _gridSize, (index) {
      int tileNum = _tiles[index];
      return _buildTile(tileNum);
    });
  }

  // build a single tile widget
  Widget _buildTile(int tileNum) {
    bool isEmptyTile = tileNum == _tiles.length - 1;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (!isEmptyTile) {
            int tileIndex = _tiles.indexOf(tileNum);
            int emptyIndex = _tiles.indexOf(_tiles.length - 1);
            setState(() {
              _tiles[tileIndex] = _tiles.length - 1;
              _tiles[emptyIndex] = tileNum;
              _tileWidgets[tileIndex] = _buildTile(_tiles[tileIndex]);
              _tileWidgets[emptyIndex] = _buildTile(_tiles[emptyIndex]);
            });
          }
        },
        child: Container(
          color: isEmptyTile ? Colors.white : Colors.blue,
          child: Center(
            child: Text(
              isEmptyTile ? '' : '${tileNum + 1}',
              style: TextStyle(
                color: isEmptyTile ? Colors.white : Colors.white,
                fontSize: 40,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // build the game board
  Widget _buildBoard() {
    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: _gridSize,
      children: _tileWidgets,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildBoard(),
          SizedBox(height: 20),
          Text('Grid size: $_gridSize'),
          Slider(
            value: _gridSize.toDouble(),
            min: 3,
            max: 6,
            divisions: 3,
            label: _gridSize.toString(),
            onChanged: (double value) {
              setState(() {
                _gridSize = value.toInt();
                _initGame();
              });
            },
          ),
        ],
      ),
    );
  }
}