import 'package:bookya/modules/bookingStatus/bloc/cubit.dart';
import 'package:bookya/modules/settings/shared/cubit/dark_mode_cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import '../../data/network/endpoints.dart';
import '../widget/nodata_toshow.dart';
import '../widget/rating_stars.dart';
import '../widget/rich_text.dart';
import '../pages/more_booking_details.dart';
import 'dart:math' as math;

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
        backgroundColor:
            DarkModeBloc.get(context).isDark ? Colors.black : Colors.white,
        body: ConditionalBuilder(
          condition: containData == true,
          builder: (context) => ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              double rate = double.parse(dataToShow.data!.data?[index].hotel!.rate);
              return GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    height: height / 3,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: DarkModeBloc.get(context).isDark
                              ? Colors.black.withOpacity(0.1)
                              : Colors.grey.shade100,
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
                        //mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: width,
                            height: height / 4.8,
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
                                        dataToShow
                                            .data!
                                            .data?[index]
                                            .hotel!
                                            .hotelImages[math.Random().nextInt(
                                                dataToShow.data!.data?[index]
                                                    .hotel!.hotelImages.length)]
                                            .image,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          // Text(dataToShow.data!.data?[index].hotel!.name,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  ' ${dataToShow.data!.data?[index].hotel.name}',
                                  style:  TextStyle(
                                    fontSize: 20.0,color: DarkModeBloc.get(context).isDark?Colors.white:Colors.black
                                  ),
                                ),
                              ),
                              PopupMenuButton<int>(
                                  color: DarkModeBloc.get(context).isDark?Colors.white:Colors.black,

                                  onSelected: (value) {
                                    // if value 1 show dialog
                                    if (value == 1) {
                                      MyBookingCubit.get(context)
                                          .postUpdatedBookingStatus(
                                              type: 'completed',
                                              bookingId: dataToShow
                                                  .data!.data?[index].id);
                                      // if value 2 show dialog
                                    } else if (value == 2) {
                                      MyBookingCubit.get(context)
                                          .postUpdatedBookingStatus(
                                              type: 'cancelled',
                                              bookingId: dataToShow
                                                  .data!.data?[index].id);
                                    }
                                  },
                                  itemBuilder: (context) =>  [
                                        PopupMenuItem(
                                          value: 1,
                                          child: Text('Completed',style: TextStyle(
                                            color: DarkModeBloc.get(context).isDark?Colors.white:Colors.black
                                          ),),
                                        ),
                                        PopupMenuItem(
                                          value: 2,
                                          child: Text('Cancelled',
                                          style: TextStyle(
                                              color: DarkModeBloc.get(context).isDark?Colors.white:Colors.black
                                          ),
                                          ),
                                        )
                                      ]),
                            ],
                          ),
                          Flexible(
                            child: Text(
                              dataToShow.data!.data?[index].hotel!.address,
                              style: TextStyle(
                                  color: DarkModeBloc.get(context).isDark?Colors.white:Colors.black
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                          SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 3),
                                child: Rating(
                                  rate: rate,
                                  color: Colors.amber,
                                ),
                              ),
                              TextWithTwoColors(
                                isBoldBigText: true,
                                bigTextColor:  DarkModeBloc.get(context).isDark?Colors.white:Colors.black,
                                smallTextColor:  DarkModeBloc.get(context).isDark?Colors.white:Colors.black,
                                bigText:
                                    '${dataToShow.data!.data?[index].hotel!.price.toString()}'
                                    ' \$',
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
                    builder: (context) => SingleChildScrollView(
                      child: DetailsHotelScreen(
                        address: dataToShow.data!.data?[index].hotel!.address,
                        hotelName: dataToShow.data!.data?[index].hotel!.name,
                        description:
                            dataToShow.data!.data?[index].hotel!.description,
                        price:
                            '${dataToShow.data!.data?[index].hotel!.price.toString()}',
                        rate: rate,
                        image: [
                          baseUrlWithNoApI +
                              "images/" +
                              '${dataToShow.data!.data?[index].hotel!.hotelImages[0].image}',
                          baseUrlWithNoApI +
                              "images/" +
                              '${dataToShow.data!.data?[index].hotel!.hotelImages[1].image}',
                          baseUrlWithNoApI +
                              "images/" +
                              '${dataToShow.data!.data?[index].hotel!.hotelImages[2].image}',
                          baseUrlWithNoApI +
                              "images/" +
                              '${dataToShow.data!.data?[index].hotel!.hotelImages[3].image}',
                          baseUrlWithNoApI +
                              "images/" +
                              '${dataToShow.data!.data?[index].hotel!.hotelImages[4].image}',
                        ],
                      ),
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
            imagePath: 'assets/Hotel_Booking.png',
            quoteBelowImage: "There isn't any ongoing data to show",
          ),
        ));
  }
}
