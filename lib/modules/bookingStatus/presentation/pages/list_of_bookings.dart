import 'package:bookya/modules/bookingStatus/presentation/widget/nodata_toshow.dart';
import 'package:bookya/modules/settings/shared/cubit/dark_mode_cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/cubit.dart';
import '../../bloc/states.dart';
import '../../data/network/endpoints.dart';
import '../pages/more_booking_details.dart';
import 'package:hexcolor/hexcolor.dart';
import 'dart:math' as math;

class ListOfBookings extends StatelessWidget {
  dynamic modelData;
  int dataLength;
  bool? containData = false;
  String? screenName;
  ListOfBookings({
    Key? key,
    required this.modelData,
    required this.dataLength,
    this.containData,
    required this.screenName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocConsumer<MyBookingCubit, MyBookingStates>(
        listener: (context, state) {},
        builder: (context, state) {
          containData = modelData.status.type.toString() == '1';

          return Scaffold(
              backgroundColor: DarkModeBloc.get(context).isDark
                  ? HexColor('#1a1a1a')
                  : Colors.white,
              body: ConditionalBuilder(
                condition: containData == true,
                builder: (context) => ListView.builder(
                  physics: const ScrollPhysics(parent: BouncingScrollPhysics()),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: height / 5.8,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              offset:
                                                  Offset.fromDirection(160.0),
                                              blurRadius: 2.5,
                                              spreadRadius: 3.7,
                                              color: Colors.black54),
                                        ],
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    height: height / 6.4,
                                    width: height / 6.4,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Image.network(
                                        // ignore: prefer_interpolation_to_compose_strings
                                        baseUrlWithNoApI +
                                            "images/" +
                                            modelData
                                                .data!
                                                .data?[index]
                                                .hotel!
                                                .hotelImages[math.Random()
                                                    .nextInt(modelData
                                                        .data!
                                                        .data?[index]
                                                        .hotel!
                                                        .hotelImages
                                                        .length)]
                                                .image,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: width / 1.8,
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            //aa.status.type.toString()
                                            Flexible(
                                              flex: 3,
                                              child: Text(
                                                '${modelData.data!.data?[index].hotel!.name}',
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: DarkModeBloc.get(context)
                                                        .isDark
                                                    ? const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16.0,
                                                      )
                                                    : const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16.0,
                                                      ),
                                              ),
                                            ),
                                            Flexible(
                                              child: Text(
                                                '${modelData.data!.data?[index].hotel!.address}',
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: DarkModeBloc.get(context)
                                                        .isDark
                                                    ? const TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 16.0,
                                                      )
                                                    : TextStyle(
                                                        color: Colors.grey[600],
                                                        fontSize: 16.0,
                                                      ),
                                              ),
                                            ),
                                            Text.rich(
                                              TextSpan(
                                                style: DarkModeBloc.get(context)
                                                        .isDark
                                                    ? TextStyle(
                                                        color: Colors.grey[200],
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16.0,
                                                      )
                                                    : const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16.0,
                                                      ),
                                                text:
                                                    '${modelData.data!.data?[index].hotel!.price.toString()}' +
                                                        '\$',
                                                children: const [
                                                  TextSpan(
                                                    text: "/per night",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.grey),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ]),
                                    ),
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
                                  address: modelData
                                      .data!.data?[index].hotel!.address,
                                  hotelName:
                                      modelData.data!.data?[index].hotel!.name,
                                  description: modelData
                                      .data!.data?[index].hotel!.description,
                                  price:
                                      '${modelData.data!.data?[index].hotel!.price.toString()}',
                                  rate: double.parse(modelData
                                          .data!.data?[index].hotel!.rate) /
                                      2.0,
                                  image: [
                                    // ignore: prefer_interpolation_to_compose_strings
                                    baseUrlWithNoApI +
                                        "images/" +
                                        '${modelData.data!.data?[index].hotel!.hotelImages[0].image}',
                                    // ignore: prefer_interpolation_to_compose_strings
                                    baseUrlWithNoApI +
                                        "images/" +
                                        '${modelData.data!.data?[index].hotel!.hotelImages[1].image}',
                                    // ignore: prefer_interpolation_to_compose_strings
                                    baseUrlWithNoApI +
                                        "images/" +
                                        '${modelData.data!.data?[index].hotel!.hotelImages[2].image}',
                                    // ignore: prefer_interpolation_to_compose_strings
                                    baseUrlWithNoApI +
                                        "images/" +
                                        '${modelData.data!.data?[index].hotel!.hotelImages[3].image}',
                                    // ignore: prefer_interpolation_to_compose_strings
                                    baseUrlWithNoApI +
                                        "images/" +
                                        '${modelData.data!.data?[index].hotel!.hotelImages[4].image}',
                                  ],
                                ),
                              ),
                            ));
                  },
                  itemCount: dataLength,
                ),
                fallback: (context) => NoDataToShow(
                  height: height,
                  width: width,
                  imagePath: 'assets/Hotel_Booking.png',
                  quoteBelowImage:
                      "There isn't any data in $screenName to show \n go and book now",
                ),
              ));
        });
  }
}
