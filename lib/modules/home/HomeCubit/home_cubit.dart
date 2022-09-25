import 'package:bloc/bloc.dart';
import 'package:bookya/modules/settings/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context)=>BlocProvider.of(context);
  int currentIndex = 0;
  int indicatorIndex = 0;

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

  void changeAppColor(String color){
    if(color == 'Red'){
      defaultColor = Colors.red;
      emit(AppChangeColorState());
    }else if(color == 'Orange'){
      defaultColor = Colors.orange;
      emit(AppChangeColorState());
    }else if(color == 'Amber'){
      defaultColor = Colors.amber;
      emit(AppChangeColorState());
    }else{
      defaultColor = Colors.teal;
      emit(AppChangeColorState());
    }
  }
}