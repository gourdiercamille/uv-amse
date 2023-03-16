import 'package:flutter/material.dart';

// import 'util.dart';
import 'exercice1.dart' as exo1;
import 'exercice2.dart' as exo2;
import 'exercice2bis.dart' as exo2bis;
import 'exercice4.dart' as exo4;
import 'exercice5.dart' as exo5;
import 'exercice5bis.dart' as exo5bis;
import 'exercice5ter.dart' as exo5ter;
import 'exercice5terlevrai.dart' as exo5terlevrai;
import 'exercice6.dart' as exo6;
import 'jeudetaquin.dart' as jeu1;
import 'jeudetaquinfinal.dart' as jeu2;
import 'jeudetaquinprof.dart' as jeu3;

void main() => runApp(TaquinApp());

class TaquinApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MenuPage());
  }
}

class Exo {
  final String title;
  final String subtitle;
  final WidgetBuilder buildFunc;

  const Exo({required this.title, required this.subtitle, required this.buildFunc});
}

List exos = [
  Exo(
      title: 'Exercice 1',
      subtitle: 'Simple image',
      buildFunc: (context) => exo1.DisplayImageWidget()),
  Exo(
      title: 'Exercice 2',
      subtitle: 'Rotate&Scale image',
      buildFunc: (context) => exo2.SliderApp()),
  Exo(
      title: 'Exercice 2 bis',
      subtitle: 'Animated Rotate&Scale image',
      buildFunc: (context) => exo2bis.DisplayImageWidget()),
  Exo(
      title: 'Exercice 4',
      subtitle: 'Display a Tile',
      buildFunc: (context) => exo4.DisplayTileWidget()),
  Exo(
      title: 'Exercice 5',
      subtitle: 'Grid of Colored Boxes ',
      buildFunc: (context) => exo5.DisplayGridViewTileWidget()),
  Exo(
      title: 'Exercice 5bis',
      subtitle: 'Grid of Cropped Images',
      buildFunc: (context) => exo5bis.DisplayGridViewTileWidget()),
  Exo(
      title: 'Exercice 5ter',
      subtitle: 'Grid of Cropped Images',
      buildFunc: (context) => exo5ter.MyApp()),
  Exo(
      title: 'Exercice 5terlevrai',
      subtitle: 'Grid of Cropped Images with a variable size',
      buildFunc: (context) => exo5terlevrai.MyApp()),
  Exo(
      title: 'Exercice 6',
      subtitle: 'Moving Tiles',
      buildFunc: (context) => exo6.PositionedTiles()),
  Exo(
      title: 'Jeu de Taquin',
      subtitle: 'The Complete Application',
      buildFunc: (context) => jeu1.TaquinApp()),
  Exo(
      title: 'Jeu de Taquin Final',
      subtitle: 'The Complete Application',
      buildFunc: (context) => jeu2.MyApp()),
  Exo(
      title: 'Jeu de Taquin du Prof',
      subtitle: 'The Complete Application',
      buildFunc: (context) => jeu3.MyApp())
];

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('TP2'),
        ),
        body: ListView.builder(
            itemCount: exos.length,
            itemBuilder: (context, index) {
              var exo = exos[index];
              return Card(
                  child: ListTile(
                      title: Text(exo.title),
                      subtitle: Text(exo.subtitle),
                      trailing: Icon(Icons.play_arrow_rounded),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: exo.buildFunc),
                        );
                      }));
            }));
  }
}