import 'package:flutter/material.dart';

class NoDataToSHow extends StatelessWidget {
  final double height;
  final double width;
  const NoDataToSHow({Key? key, required this.height, required this.width})
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
              'assets/Hotel_Booking.png',
            ),
          ),
          const Text(
            "There isn't any data here to show \n go and book now",
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
