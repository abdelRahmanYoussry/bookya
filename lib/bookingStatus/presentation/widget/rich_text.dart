import 'package:flutter/material.dart';

class TextWithTwoColors extends StatelessWidget {
  final String bigText;
  final String smallText;
  final Color bigTextColor;
  final Color smallTextColor;
  final double bigTextFontSize;
  final double smallTextFontSize;
  TextWithTwoColors({
    Key? key,
    required this.bigText,
    required this.smallText,
    this.smallTextFontSize = 16,
    this.bigTextFontSize = 18,
    this.bigTextColor = Colors.black,
    this.smallTextColor = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: TextStyle(fontSize: bigTextFontSize, color: bigTextColor),
        text: bigText,
        children: [
          TextSpan(
              text: smallText,
              style: TextStyle(
                  fontSize: smallTextFontSize, color: smallTextColor)),
        ],
      ),
    );
  }
}
