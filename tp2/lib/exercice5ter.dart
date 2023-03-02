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

class DisplayGridViewTileWidget extends StatelessWidget {
    double _currentSliderValue = 3;
  @override
  Widget build(BuildContext context) {
    void construcTaquin(int _currentSliderValue){
    int compteur = 0;
    double decoupage = 0;
    if (_currentSliderValue == 3){
         decoupage = 1;
    }
    if (_currentSliderValue == 4){
         decoupage = 2/3;
    }
    if (_currentSliderValue == 5){
         decoupage = 1/2;
    }
    if (_currentSliderValue == 6){
        decoupage = 0.4;
    }
    if (_currentSliderValue == 7){
        decoupage = 1/3;
    }
    for (double i = -1; i <= 1; i += decoupage){
        for (double j = -1; j <= 1; j += decoupage){
            Tile tile = new Tile(
            image: Image.asset('assets/tiger.jpg'), alignment: Alignment(j,i));
        }
    }
    }
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
            crossAxisCount: (int)_currentSliderValue,
            children: <Widget>[
            for (double i = 0; i <= _currentSliderValue * _currentSliderValue; i++){
                String nameTile = 'tile'+compteur.toString();
                Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[100+compteur*100],
                    child: createTileWidgetFrom(nameTile),
                ),
                compteur++;
            },
            Slider(
                    value: _currentSliderValue,
                    label: _currentSliderValue.round().toString(),                      
                    onChanged: (double value) {
                        setState(() {
                            _currentSliderValue = value;
                        });
                    },
                )
            ]
        )
    );

    Widget createTileWidgetFrom(Tile tile) {
    return InkWell(
      child: tile.croppedImageTile(),
      onTap: () {
        print("tapped on tile");
      },
    );
  }
    runApp(const SliderApp());
  }
}





