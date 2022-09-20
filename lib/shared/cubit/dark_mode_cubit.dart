import 'package:bookya/shared/cubit/dark_mode_states.dart';
import 'package:bookya/shared/network/local/cache_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DarkModeBloc extends Cubit<DarkModeStates>{
  DarkModeBloc() : super(AppInitialState());

  static DarkModeBloc get(context) => BlocProvider.of(context);

  bool isDark = false;
  void changeAppMode({bool? fromShared}){
    if(fromShared != null){
      isDark = fromShared;
      emit(AppChangeModeState());
    }else{
      isDark = !isDark;
      CacheHelper.saveData(key: 'isDark', value: isDark).then((value) {
        emit(AppChangeModeState());
      });
    }

  }
}