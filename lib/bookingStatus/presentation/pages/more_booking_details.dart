import 'package:flutter/material.dart';

import '../widget/rating_stars.dart';
import '../widget/rich_text.dart';
import '../widget/slideshow_images.dart';

class DetailsHotelScreen extends StatelessWidget {
  final String hotelName;
  final String description;
  final String price;
  final double rate;
  final List image;

  const DetailsHotelScreen({
    Key? key,
    required this.hotelName,
    required this.description,
    required this.price,
    required this.rate,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    List<dynamic> images = [
      [
        'https://image.makewebeasy.net/makeweb/0/GYWrZvZVh/ADVICE/%E0%B8%94%E0%B8%B2%E0%B8%A7%E0%B8%99%E0%B9%8C%E0%B9%82%E0%B8%AB%E0%B8%A5%E0%B8%94_2_.jpg',
      ]
    ];

    bool isNoImages = false;
    if (image[0] == 'No data to show') {
      isNoImages = true;
    } else {
      isNoImages == false;
    }

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
            SlideShow(
              height: height,
              images: isNoImages == true ? images : image,
              width: width,
            ),
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
