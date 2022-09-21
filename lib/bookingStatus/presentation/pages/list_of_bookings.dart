import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import '../widget/image_with_shadow.dart';
import '../widget/nodata_toshow.dart';
import '../widget/rating_stars.dart';
import '../widget/rich_text.dart';
import '../pages/more_booking_details.dart';

class ListOfBookings extends StatelessWidget {
  List data = [];
  ListOfBookings({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ConditionalBuilder(
        condition: data.isNotEmpty,
        builder: (context) => ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            String prate = data[index]['hotel']['rate'];
            double rate = double.parse(prate);
            return GestureDetector(
              child: SizedBox(
                height: height / 5,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      ImageWithShadow(
                          height: height,
                          width: width,
                          imagePath: data[index]['hotel']['hotel_images'][0]
                              ['image']),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(data[index]['hotel']['name']),
                              Text(
                                data[index]['hotel']['description'],
                                style: const TextStyle(color: Colors.grey),
                              ),
                              Rating(
                                rate: rate,
                                iconSize: 15,
                              ),
                              TextWithTwoColors(
                                bigText:
                                    data[index]['hotel']['price'].toString() +
                                        ' EGP',
                                smallText: '/per night',
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsHotelScreen(
                    hotelName: data[index]['hotel']['name'],
                    description: data[index]['hotel']['description'],
                    price: data[index]['hotel']['price'].toString(),
                    rate: rate,
                  ),
                ),
              ),
            );
          },
          itemCount: data.length,
        ),
        fallback: (context) => NoDataToSHow(height: height, width: width),
      ),
    );
  }
}
