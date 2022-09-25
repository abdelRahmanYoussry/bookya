import 'package:bookya/modules/bookingStatus/presentation/widget/nodata_toshow.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/cubit.dart';
import '../../bloc/states.dart';
import '../../data/network/endpoints.dart';
import '../pages/more_booking_details.dart';

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
              body: ConditionalBuilder(
                condition: containData == true,
                builder: (context) => ListView.builder(
                  physics: const ScrollPhysics(parent: BouncingScrollPhysics()),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 90,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              offset: Offset.fromDirection(160.0),
                                              blurRadius: 2.5,
                                              spreadRadius: 3.7,
                                              color: Colors.black54),
                                        ],
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10)),
                                    height: height / 6.4,
                                    width: height / 6.4,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Image.network(
                                        modelData.data!.data?[index].hotel!
                                            .hotelImages.isEmpty
                                            ? 'https://image.makewebeasy.net/makeweb/0/GYWrZvZVh/ADVICE/%E0%B8%94%E0%B8%B2%E0%B8%A7%E0%B8%99%E0%B9%8C%E0%B9%82%E0%B8%AB%E0%B8%A5%E0%B8%94_2_.jpg'
                                            : baseUrlWithNoApI +
                                            "images/" +
                                            modelData.data!.data?[index].hotel!
                                                .hotelImages[0].image,
                                        fit: BoxFit.fill,
                                      ),
                                      
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          //aa.status.type.toString()
                                          Text(
                                              '${modelData.data!.data?[index].type}'),
                                          Text(
                                      '${modelData.data!.data?[index].hotel!.description}',
                                      style: const TextStyle(color: Colors.grey),
                                    ),
                                        ]
                                          ),
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
                                  // ignore: unrelated_type_equality_checks
                                  if (baseUrlWithNoApI +
                                      "images/" +
                                      '${modelData.data!.data?[index].hotel!.hotelImages.isEmpty}' ==
                                      'http://api.mahmoudtaha.com/images/false')
                                    [
                                      baseUrlWithNoApI +
                                          "images/" +
                                          '${modelData.data!.data?[index].hotel!.hotelImages[0].image}',
                                      baseUrlWithNoApI +
                                          "images/" +
                                          '${modelData.data!.data?[index].hotel!.hotelImages[1].image}'
                                    ]
                                  else
                                    'No data to show'
                                ]),
                          ),
                        ));
                  },
                  itemCount: dataLength,
                ),
                fallback: (context) => NoDataToShow(
                  height: height,
                  width: width,
                  imagePath: 'assets/No data-rafiki.png',
                  quoteBelowImage:
                  "There isn't any data in $screenName to show \n go and book now",
                ),
              ));
        });
  }
}
