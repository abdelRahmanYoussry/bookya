import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import '../widget/rating_stars.dart';
import '../widget/rich_text.dart';
import '../widget/slideshow_images.dart';

class DetailsHotelScreen extends StatelessWidget {
  final String hotelName;
  final String description;
  final String price;
  final double rate;
  final List image;
  final String address;
  const DetailsHotelScreen({
    Key? key,
    required this.hotelName,
    required this.description,
    required this.price,
    required this.rate,
    required this.image,
    required this.address,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

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
              images: image,
              width: width,
            ),
            Flexible(
                child: ReadMoreText(
              description,
              colorClickableText: Colors.teal,
              trimCollapsedText: 'Show more',
              trimExpandedText: 'Show less',
              style: const TextStyle(color: Colors.black),
            )),
            SizedBox(
              height: height / 60,
            ),
            Text(
              'at $address',
            ),
            SizedBox(
              height: height / 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWithTwoColors(
                    bigText: price + ' \$', smallText: '/per Night'),
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
