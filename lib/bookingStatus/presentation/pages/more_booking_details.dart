import 'package:flutter/material.dart';

import '../widget/rich_text.dart';

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
        backgroundColor: Colors.teal,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
        title: Text(hotelName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SlideShow(height: height, images: images, width: width),
            Flexible(child: Text(description)),
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
    );
  }
}
