import 'package:bookya/modules/bookingStatus/presentation/pages/list_of_bookings.dart';
import 'package:bookya/modules/settings/shared/styles/colors.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/cubit.dart';
import '../../bloc/states.dart';
import '../pages/ongoing_screen.dart';


class TabScreen extends StatelessWidget {
  const TabScreen({
    Key? key,
    MyBookingCubit? cancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyBookingCubit, MyBookingStates>(
      listener: (context, state) {},
      builder: (context, state) {
        dynamic compeletdBooking =
            MyBookingCubit.get(context).bookingCompletedModel;
        dynamic ongoingBooking =
            MyBookingCubit.get(context).bookingOngoingModel;
        dynamic cancelledBooking =
            MyBookingCubit.get(context).bookingCancelledModel;
        dynamic ongoingLength = MyBookingCubit.get(context).ongoingLength;
        dynamic cancelledLength = MyBookingCubit.get(context).cancelledLength;
        dynamic completedLength = MyBookingCubit.get(context).completedLength;

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                elevation: 1.0,
                backgroundColor: defaultColor,
                bottom: const TabBar(
                  labelColor: Colors.white,
                  indicatorColor: Colors.white,
                  labelPadding: EdgeInsets.zero,
                  indicatorSize: TabBarIndicatorSize.label,
                  unselectedLabelColor: Color.fromRGBO(200, 200, 200, 1.0),
                  tabs: [
                    Tab(
                      text: 'OnGoing',
                    ),
                    Tab(
                      text: 'Completed',
                    ),
                    Tab(
                      text: 'Cancelled',
                    ),
                  ],
                ),
                title: const Padding(
                    padding: EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                    child: Text('My Booking')),
              ),
              body: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  TabBarView(
                    children: [
                      ConditionalBuilder(
                        condition: state is! MyBookingOngoingLoadingState,
                        builder: (context) => UpComingScreen(
                            dataToShow: ongoingBooking,
                            dataLength: ongoingLength),
                        fallback: (BuildContext context) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                      ConditionalBuilder(
                        condition: state is! MyBookingCompletedLoadingState,
                        builder: (context) => ListOfBookings(
                            modelData: compeletdBooking,
                            dataLength: completedLength,
                            screenName: 'completed'),
                        fallback: (BuildContext context) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                      ConditionalBuilder(
                        condition: state is! MyBookingCancelledLoadingState,
                        builder: (context) => ListOfBookings(
                          modelData: cancelledBooking,
                          dataLength: cancelledLength,
                          screenName: 'cancelled',
                        ),
                        fallback: (BuildContext context) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
