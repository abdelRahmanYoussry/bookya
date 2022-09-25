import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import '../../data/network/endpoints.dart';
import '../styles/text_style.dart';
import '../widget/nodata_toshow.dart';
import '../widget/rating_stars.dart';
import '../widget/rich_text.dart';

import '../pages/more_booking_details.dart';

class UpComingScreen extends StatelessWidget {
  dynamic dataToShow;
  int dataLength;
  bool? containData;
  UpComingScreen({Key? key, required this.dataToShow, required this.dataLength})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    containData = dataToShow.status.type.toString() == '1';
    return Scaffold(
        body: ConditionalBuilder(
          condition: containData == true,
          builder: (context) => ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              double rate = double.parse(dataToShow.data!.data?[index].hotel!.rate);
              return GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    height: height / 2.8,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          offset: Offset.fromDirection(140.0),
                          blurRadius: 1.0,
                          spreadRadius: 1.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: width,
                            height: height / 4.2,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  topLeft: Radius.circular(20)),
                              child: Image.network(
                                dataToShow.data!.data?[index].hotel!.hotelImages
                                    .isEmpty
                                    ? 'https://image.makewebeasy.net/makeweb/0/GYWrZvZVh/ADVICE/%E0%B8%94%E0%B8%B2%E0%B8%A7%E0%B8%99%E0%B9%8C%E0%B9%82%E0%B8%AB%E0%B8%A5%E0%B8%94_2_.jpg'
                                    : baseUrlWithNoApI +
                                    "images/" +
                                    dataToShow.data!.data?[index].hotel!
                                        .hotelImages[0].image,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Text(dataToShow.data!.data?[index].hotel!.name,
                              style: boldBlackFont),
                          Flexible(
                            child: Text(
                              dataToShow.data!.data?[index].hotel!.description,
                              style: normakBlackFont,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 3),
                                child: Rating(
                                  rate: rate,
                                ),
                              ),
                              TextWithTwoColors(
                                isBoldBigText: true,
                                bigText:
                                '${dataToShow.data!.data?[index].hotel!.price.toString()}'
                                    ' EGP',
                                smallText: '/per night  ',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsHotelScreen(
                      hotelName: dataToShow.data!.data?[index].hotel!.name,
                      description: dataToShow.data!.data?[index].hotel!.descrition,
                      price:
                      '${dataToShow.data!.data?[index].hotel!.price.toString()}',
                      rate: rate,
                      image: [
                        if (baseUrlWithNoApI +
                            "images/" +
                            '${dataToShow.data!.data?[index].hotel!.hotelImages.isEmpty}' ==
                            'http://api.mahmoudtaha.com/images/false')
                          [
                            baseUrlWithNoApI +
                                "images/" +
                                '${dataToShow.data!.data?[index].hotel!.hotelImages[0].image}',
                            baseUrlWithNoApI +
                                "images/" +
                                '${dataToShow.data!.data?[index].hotel!.hotelImages[1].image}'
                          ]
                        else
                          'No data to show'
                      ],
                    ),
                  ),
                ),
              );
            },
            itemCount: dataLength,
          ),
          fallback: (BuildContext context) => NoDataToShow(
            height: height,
            width: width,
            imagePath: 'assets/No data-rafiki.png',
            quoteBelowImage: "There isn't any ongoing data to show",
          ),
        ));
  }
}
