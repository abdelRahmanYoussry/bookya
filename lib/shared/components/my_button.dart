import 'package:flutter/material.dart';


class MyButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final double height;
  final double width;
  final Color backGroundColor;
  final double borderRadius;
  final VoidCallback onPress;

  const MyButton({
    Key? key,
    required this.text,
    this.textColor = Colors.white,
    required this.height ,
    required this.width ,
    this.backGroundColor = Colors.teal,
    this.borderRadius = 8.0,
    required this.onPress,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backGroundColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
        ),

        onPressed: (){
          onPress();
        },
        child: Text(
          text,
          style: TextStyle(
              color: textColor
          ),
        ),),
    );
  }
}
