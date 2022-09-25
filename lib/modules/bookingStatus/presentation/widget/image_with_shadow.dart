import 'package:flutter/material.dart';

class ImageWithShadow extends StatelessWidget {
  final double height;
  final double width;
  final String imagePath;
  const ImageWithShadow(
      {Key? key,
      required this.height,
      required this.width,
      required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            offset: Offset.fromDirection(160.0),
            blurRadius: 2.5,
            spreadRadius: 3.7,
            color: Colors.black54),
      ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
      height: height / 6.4,
      width: height / 6.4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image.network(
          imagePath,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
