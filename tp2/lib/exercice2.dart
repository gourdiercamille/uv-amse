import 'package:flutter/material.dart';
// import 'package:Taquin/util.dart';
import 'dart:math';


void main() => runApp(const SliderApp());

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

class _SliderExampleState extends State<SliderExample> {
  double _currentSliderPrimaryValue = 0;
  double _currentSliderSecondaryValue = 0;
  double _currentSliderTertiaryValue = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Slider')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(color: Colors.white),
            child:Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..rotateX(_currentSliderPrimaryValue)
                ..rotateZ(_currentSliderSecondaryValue)
                ..scale(_currentSliderTertiaryValue),
              child : Image.asset ('assets/image_sympa.jpg',
                )
            )
          ),
          SliderTheme(
            data: SliderThemeData(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text( 'RotateX', 
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0),
                  ),
                  Slider(
                    value: _currentSliderPrimaryValue,
                    max: 2*pi,
                    label: _currentSliderPrimaryValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _currentSliderPrimaryValue = value;
                      });
                    },
                  ),
                ],
            ),
          ),
          SliderTheme(
            data: SliderThemeData(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text( 'RotateZ', 
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0),
                  ),
                  Slider(
                    value: _currentSliderSecondaryValue,
                    max: 2*pi,
                    label: _currentSliderSecondaryValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _currentSliderSecondaryValue = value;
                      });
                    },
                  ),
                ],
            ),
          ),
          SliderTheme(
            data: SliderThemeData(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text( 'Scale', 
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0),
                  ),
                  Slider(
                    value: _currentSliderTertiaryValue,
                    max: 10,
                    label: _currentSliderTertiaryValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _currentSliderTertiaryValue = value;
                      });
                    },
                  ),
                ],
            ),
          )
        ],
      ),
    );
  }
}

