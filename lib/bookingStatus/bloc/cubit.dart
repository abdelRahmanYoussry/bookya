import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/states.dart';
import '../data/model/mybooking.dart';
import '../data/network/helper/dio_helper.dart';
import '../data/network/endpoints.dart';

class MyBookingCubit extends Cubit<MyBookingStates> {
  MyBookingCubit() : super(MyBookingInitialState());
  static MyBookingCubit get(context) => BlocProvider.of(context);

  MyBookingModel? bookingOngoingModel;
  MyBookingModel? bookingCompletedModel;
  MyBookingModel? bookingCancelledModel;

  void postUpdatedpdateBooking({required String type, required int bookingId}) {
    DioHelper.postData(
        url: updateBookingStatus,
        data: {'booking_id': 7, 'type': 'completed'}).then((value) {
      debugPrint(value.data);

      emit(MyBookingUpdatingStatusSuccessState());
      debugPrint('Update Booking' + value.data);
    }).catchError((error) {
      debugPrint('update error:' + error.toString());
      emit(MyBookingErrorState(error.toString()));
    });
  }

  void postCreateBooking({required int userId, required int hotelId}) {
    DioHelper.postData(
        url: createBooking,
        data: {'user_id': userId, 'hotel_id': hotelId}).then((value) {
      debugPrint(value.data);

      emit(MyBookingCreateBookingSuccessState());
      debugPrint('Create Booking' + value.data);
    }).catchError((error) {
      debugPrint('Create error:' + error.toString());
      emit(MyBookingErrorState(error.toString()));
    });
  }

  int? cancelledLength;
  void getBookingDataCancelled() {
    emit(MyBookingCancelledLoadingState());

    DioHelper.getData(
        url: bookingResponseData,
        query: {'type': 'cancelled', 'count': 7}).then((value) {
      bookingCancelledModel = MyBookingModel.fromJson(value.data);

      cancelledLength = bookingCancelledModel!.data!.data!.length;
      print('Booking cancelled Data:$bookingCancelledModel');
      emit(MyBookingCancelledSuccessState(bookingCancelledModel!));
    }).catchError((error) {
      debugPrint('Error: ${error.toString()}');
      emit(MyBookingErrorState(error.toString()));
    });
  }

  int? completedLength;
  void getBookingDataCompleted() {
    emit(MyBookingCompletedLoadingState());

    DioHelper.getData(
        url: bookingResponseData,
        query: {'type': 'completed', 'count': 7}).then((value) {
      bookingCompletedModel = MyBookingModel.fromJson(value.data);

      completedLength = bookingCompletedModel!.data!.data!.length;
      print('Booking completed Data:$bookingCompletedModel');
      emit(MyBookingCompletedSuccessState(bookingCompletedModel!));
    }).catchError((error) {
      debugPrint('Error: ${error.toString()}');
      emit(MyBookingErrorState(error.toString()));
    });
  }

  int ongoingLength = 1;
  void getBookingDataOngoing() {
    emit(MyBookingOngoingLoadingState());

    DioHelper.getData(
        url: bookingResponseData,
        query: {'type': 'upcomming', 'count': 7}).then((value) {
      bookingOngoingModel = MyBookingModel.fromJson(value.data);

      ongoingLength = bookingOngoingModel!.data!.data!.length;
      print('Booking ongoing Model $bookingOngoingModel');
      emit(MyBookingOngoingSuccessState(bookingOngoingModel!));
    }).catchError((error) {
      debugPrint('Ongoing Error: ${error.toString()}');
      emit(MyBookingErrorState(error.toString()));
    });
  }
}
