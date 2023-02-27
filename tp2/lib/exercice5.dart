import 'package:flutter/material.dart';

class DisplayGridViewTileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Display a Tile as a Cropped Image'),
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
                child: const Text("Tile1"),
            ),
            Container(
                padding: const EdgeInsets.all(8),
                color: Colors.teal[200],
                child: const Text('Tile2'),
            ),
            Container(
                padding: const EdgeInsets.all(8),
                color: Colors.teal[300],
                child: const Text('Tile3'),
            ),
            Container(
                padding: const EdgeInsets.all(8),
                color: Colors.teal[400],
                child: const Text('Tile4'),
            ),
            Container(
                padding: const EdgeInsets.all(8),
                color: Colors.teal[500],
                child: const Text('Tile5'),
            ),
            Container(
                padding: const EdgeInsets.all(8),
                color: Colors.teal[600],
                child: const Text('Tile6'),
            ),
            Container(
                padding: const EdgeInsets.all(8),
                color: Colors.teal[700],
                child: const Text('Tile7'),
            ),
            Container(
                padding: const EdgeInsets.all(8),
                color: Colors.teal[800],
                child: const Text('Tile8'),
            ),
            Container(
                padding: const EdgeInsets.all(8),
                color: Colors.teal[900],
                child: const Text('Tile9'),
            )
            ]
        )
    );
  }
}

