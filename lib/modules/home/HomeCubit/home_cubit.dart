import 'package:bloc/bloc.dart';
import 'package:bookya/modules/bookingStatus/data/network/helper/dio_helper.dart';
import 'package:bookya/modules/home/Data/HomeEndPoints.dart';
import 'package:bookya/modules/home/Data/HomeModels/HomeModel.dart';
import 'package:bookya/shared/network/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context)=>BlocProvider.of(context);
  int currentIndex = 0;
  int indicatorIndex = 0;
  HomeModel ?homeModel;

  void changeNavBar(int index)
  {
    currentIndex = index;
    if (currentIndex == 0) {
      emit(ExploreScreen());
    }
    else if (currentIndex == 1) {
      emit(TripsScreen());
    }
    else {
      emit(ProfScreen());
    }
  }


  void changeIndicatorIndex(int index,dynamic reson)
  {
    indicatorIndex = index;
    emit(ChangeIndicator());
  }


  void getHotels(){
    emit(LoadingGetHotel());
    FinalDioHelper.getData(url: hotelUrl,
      query: {}
    ).then((value) {
      // debugPrint(value!.data.toString());
      homeModel=HomeModel.fromJson(value.data);
      debugPrint(homeModel!.data!.data![0].hotelImages![0].image);
      emit(SuccessGetHotel());
    }).catchError((error){
      emit(ErrorGetHotel(error: error.toString()));
      debugPrint(error.toString());

    });
  }


// void getHotels(){
  //   emit(LoadingGetHotel());
  //   FinalDioHelper.getData(url: hotelUrl,
  //
  //  ).then((value) {
  //     // debugPrint(value!.data.toString());
  //     homeModel=HomeModel.fromJson(value.data);
  //     debugPrint(homeModel!.data!.data![0].hotelImages![0].image);
  //     emit(SuccessGetHotel());
  //   }).catchError((error){
  //     emit(ErrorGetHotel(error: error.toString()));
  //     debugPrint(error.toString());
  //
  //   });
  // }
}