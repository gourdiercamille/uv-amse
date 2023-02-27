import 'package:flutter/material.dart';

// import 'util.dart';
import 'exercice1.dart' as exo1;
import 'exercice2.dart' as exo2;
import 'exercice2bis.dart' as exo2bis;
import 'exercice4.dart' as exo4;
import 'exercice5.dart' as exo5;
import 'exercice5bis.dart' as exo5bis;

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
      buildFunc: (context) => exo5bis.DisplayGridViewTileWidget())
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