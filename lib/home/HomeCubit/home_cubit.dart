import 'package:bloc/bloc.dart';
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
}
