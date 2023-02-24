import 'package:flutter/material.dart';
// import 'package:Taquin/util.dart';
import 'dart:math';

class DisplayImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Display image'),
        ),
        // body: Center(child: Image.network("https://picsum.photos/1024")));
        body: Center(
          child:
            Image.asset(
                'assets/image_sympa.jpg',
                width: 350,
                height: 350,
                fit: BoxFit.cover,
                ),
        ));
  }
}

class ImageRotator extends StatefulWidget {
  final ImageProvider image;

  ImageRotator({required this.image});

  @override
  _ImageRotatorState createState() => _ImageRotatorState();
}

class _ImageRotatorState extends State<ImageRotator> {
  double angle = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Transform.rotate(
          angle: angle,
          child: Image(image: widget.image),
        ),
        Slider(
          value: angle,
          min: 0,
          max: 2 * 3.14, // 2*pi
          onChanged: (value) {
            setState(() {
              angle = value;
            });
          },
        ),
      ],
    );
  }
}

