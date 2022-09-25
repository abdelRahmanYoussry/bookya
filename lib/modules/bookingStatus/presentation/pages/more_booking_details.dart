import 'package:bookya/modules/settings/shared/cubit/dark_mode_cubit.dart';
import 'package:bookya/modules/settings/shared/styles/colors.dart';
import 'package:flutter/material.dart';

import '../widget/rich_text.dart';
import 'package:hexcolor/hexcolor.dart';
import '../widget/rating_stars.dart';

import '../widget/slideshow_images.dart';

class DetailsHotelScreen extends StatelessWidget {
  final String hotelName;
  final String description;
  final String price;
  final double rate;

  const DetailsHotelScreen({
    Key? key,
    required this.hotelName,
    required this.description,
    required this.price,
    required this.rate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    List<String> images = [
      "assets/hotel1.jpg",
      "assets/hotel2.jpg",
      'assets/hotel3.jpg'
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: DarkModeBloc.get(context).isDark ?  HexColor('#1a1a1a') : defaultColor,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon:
            const Icon(Icons.arrow_back_ios_new),
          color: DarkModeBloc.get(context).isDark ? Colors.white : HexColor('#1a1a1a'),
        ),
        title: Text(hotelName,
        style: DarkModeBloc.get(context).isDark ?const TextStyle(
          color: Colors.white,
        ): TextStyle(
          color: HexColor('#1a1a1a'),
        ),
        ),
      ),
      body: Container(
        color: DarkModeBloc.get(context).isDark ? HexColor('#1a1a1a') : Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SlideShow(height: height, images: images, width: width,),
              SizedBox(
                height: height / 25,
              ),
              Flexible(child: Text(description,
              style: DarkModeBloc.get(context).isDark? const TextStyle(
                color: Colors.white,
                fontSize: 22.0,
              ): TextStyle(
                color: HexColor('#1a1a1a'),
                fontSize: 22.0,
              ),)),
              SizedBox(
                height: height / 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWithTwoColors(
                      bigText: price + ' EGP', smallText: '/per Night'),
                  Rating(
                    rate: rate,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
