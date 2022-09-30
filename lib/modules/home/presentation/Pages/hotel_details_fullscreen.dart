import 'package:bookya/modules/bookingStatus/bloc/cubit.dart';
import 'package:bookya/modules/bookingStatus/presentation/widget/rating_stars.dart';
import 'package:bookya/modules/bookingStatus/presentation/widget/rich_text.dart';
import 'package:bookya/modules/home/HomeCubit/home_cubit.dart';
import 'package:bookya/modules/settings/shared/cubit/dark_mode_cubit.dart';
import 'package:bookya/modules/settings/shared/widgets/main_button.dart';
import 'package:bookya/shared/network/url_api.dart';
import 'package:bookya/shared/shared_pref.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class FullScreenDetailsHotelScreen extends StatelessWidget {
  final String hotelName;
  final String description;
  final String price;
  final String address;
  final double rate;
  final List image;
  final int hotelId;

  const FullScreenDetailsHotelScreen({
    Key? key,
    required this.hotelName,
    required this.address,
    required this.description,
    required this.price,
    required this.rate,
    required this.image,
    required this.hotelId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    int? userId = SharedPref.getUserId();

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



    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: DarkModeBloc.get(context).isDark? Colors.transparent : Colors.transparent,
          leading: CircleAvatar(
            backgroundColor: const Color.fromARGB(70, 0, 0, 0),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                )),
          ),
        ),
        body: Stack(
          children: [
          HomeCubit.get(context).searchImage?  Image.network(image[0], height: height, fit: BoxFit.cover):
          Image.network(
              image[0][math.Random().nextInt(image.length)], // new
              height: height,
              fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Center(
                    child: Container(
                      width: width/1.2,
                      decoration: BoxDecoration(
                          color: DarkModeBloc.get(context).isDark?Colors.black:Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                hotelName.toUpperCase(),
                                style: DarkModeBloc.get(context).isDark ? const TextStyle(
                                  color: Colors.white,
                                    fontWeight: FontWeight.w500, fontSize: 18) :
                                const TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 18,
                                color: Colors.black),
                              ),
                              const SizedBox(
                                  height: 5.0,
                              ),
                              Text(
                                'At' + ' $address'.toUpperCase(),
                                style:  DarkModeBloc.get(context).isDark ? const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500, fontSize: 16) :const TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 16,
                                    color: Colors.black),
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Rating(rate: rate,color: Colors.amber),
                                  TextWithTwoColors(
                                    bigTextColor: DarkModeBloc.get(context).isDark?Colors.white:Colors.black,
                                      bigText: price + 'EGP',
                                      smallText: '/per night')
                                ],
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MainButton(text: 'Book Now', function: (){
                                    MyBookingCubit.get(
                                        context) //new all the function
                                        .postCreateBooking(
                                      userId: userId!,
                                      hotelId: hotelId,
                                    );
                                  },
                                  width: width/2,

                                  ),
                                ],
                              ),
                            ]),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
