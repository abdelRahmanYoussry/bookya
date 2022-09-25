import 'package:bookya/modules/settings/shared/cubit/dark_mode_cubit.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';


class NoDataToSHow extends StatelessWidget {
  final double height;
  final double width;
  const NoDataToSHow({Key? key, required this.height, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: DarkModeBloc.get(context).isDark ?  HexColor('#1a1a1a') : Colors.white,
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
          Text(
            "There isn't any data here to show \n go and book now",
            textAlign: TextAlign.center,
            style: DarkModeBloc.get(context).isDark ? const TextStyle(
              color: Colors.white
            ) : const TextStyle(
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
