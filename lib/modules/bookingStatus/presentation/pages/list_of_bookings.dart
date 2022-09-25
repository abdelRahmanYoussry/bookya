import 'package:bookya/modules/settings/shared/cubit/dark_mode_cubit.dart';
import 'package:bookya/modules/settings/shared/cubit/dark_mode_states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import '../widget/image_with_shadow.dart';
import '../widget/nodata_toshow.dart';
import '../widget/rating_stars.dart';
import '../widget/rich_text.dart';
import '../pages/more_booking_details.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListOfBookings extends StatelessWidget {
  List data = [];

  ListOfBookings({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocConsumer<DarkModeBloc, DarkModeStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: ConditionalBuilder(
            condition: data.isNotEmpty,
            builder: (context) => ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                String prate = data[index]['hotel']['rate'];
                double rate = double.parse(prate);
                return Container(
                  color: DarkModeBloc.get(context).isDark
                      ? HexColor('#1a1a1a')
                      : Colors.white,
                  child: GestureDetector(
                    child: SizedBox(
                      height: height / 5,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            ImageWithShadow(
                                height: height,
                                width: width,
                                imagePath: data[index]['hotel']['hotel_images']
                                    [0]['image']),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data[index]['hotel']['name'],
                                      style: DarkModeBloc.get(context).isDark
                                          ? const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18.0,
                                              color: Colors.white,
                                            )
                                          : Theme.of(context)
                                              .textTheme
                                              .bodyText1!
                                              .copyWith(
                                                fontSize: 18.0,
                                              ),
                                    ),
                                    Text(
                                      data[index]['hotel']['description'],
                                      style: DarkModeBloc.get(context).isDark
                                          ? const TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.grey,
                                            )
                                          : Theme.of(context)
                                              .textTheme
                                              .caption!
                                              .copyWith(
                                                fontSize: 15,
                                              ),
                                    ),
                                    Rating(
                                      rate: rate,
                                      iconSize: 15,
                                    ),
                                    TextWithTwoColors(
                                      bigText:
                                          '${data[index]['hotel']['price']} EGP',
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
                  ),
                );
              },
              itemCount: data.length,
            ),
            fallback: (context) => NoDataToSHow(height: height, width: width),
          ),
        );
      },
    );
  }
}
