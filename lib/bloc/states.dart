import '../data/model/mybooking.dart';

abstract class MyBookingStates {}

class MyBookingInitialState extends MyBookingStates {}

class MyBookingLoadingState extends MyBookingStates {}

class MyBookingErrorState extends MyBookingStates {
  final String error;
  MyBookingErrorState(this.error);
}

class MyBookingCancelledSuccessState extends MyBookingStates {
  final MyBookingModel bookingModel;
  MyBookingCancelledSuccessState(this.bookingModel);
}

class MyBookingCompletedSuccessState extends MyBookingStates {
  final MyBookingModel bookingModel;
  MyBookingCompletedSuccessState(this.bookingModel);
}

class MyBookingOngoingSuccessState extends MyBookingStates {
  final MyBookingModel bookingModel;
  MyBookingOngoingSuccessState(this.bookingModel);
}
