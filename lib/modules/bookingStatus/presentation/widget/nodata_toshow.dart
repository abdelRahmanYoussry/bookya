import 'package:flutter/material.dart';

class NoDataToShow extends StatelessWidget {
  final double height;
  final double width;
  final String imagePath;
  final String quoteBelowImage;
  const NoDataToShow(
      {Key? key,
      required this.height,
      required this.width,
      required this.imagePath,
      required this.quoteBelowImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height / 1.5,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Image.asset(
              imagePath,
            ),
          ),
          Text(
            quoteBelowImage,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
