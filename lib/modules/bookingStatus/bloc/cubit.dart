import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/states.dart';
import '../data/model/mybooking.dart';
import '../data/network/helper/dio_helper.dart';
import '../data/network/endpoints.dart';

class MyBookingCubit extends Cubit<MyBookingStates> {
  MyBookingCubit() : super(MyBookingInitialState());
  static MyBookingCubit get(context) => BlocProvider.of(context);

  late MyBookingModel bookingModel;


  void getBookingData(String type) {
    emit(MyBookingLoadingState());

    FinalDioHelper.getData(url: bookingResponseData, query: {
      'type': type,
      'count': 10,
    }).then((value) {
      bookingModel = MyBookingModel.fromJson(value!.data);
      emit(MyBookingOngoingSuccessState(bookingModel));
    }).catchError((error) {
      debugPrint(error.toString());
    });
  }
}
