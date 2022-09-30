import 'package:bloc/bloc.dart';
import 'package:bookya/modules/boarding_pages/presentation/pages/boarding_screen.dart';
import 'package:bookya/modules/bookingStatus/bloc/cubit.dart';
import 'package:bookya/modules/bookingStatus/data/network/helper/dio_helper.dart';
import 'package:bookya/modules/filtter/FilterCubit/filter_cubit.dart';
import 'package:bookya/modules/home/HomeCubit/BlocObserver.dart';
import 'package:bookya/modules/home/HomeCubit/home_cubit.dart';
import 'package:bookya/modules/home/presentation/Pages/Tabs_screen.dart';
import 'package:bookya/modules/home/presentation/Pages/home_screen.dart';
import 'package:bookya/modules/register/domain/register_bloc.dart';
import 'package:bookya/modules/settings/modules/settings_option_page/cubit/cubit.dart';
import 'package:bookya/modules/settings/shared/cubit/dark_mode_cubit.dart';
import 'package:bookya/modules/settings/shared/cubit/dark_mode_states.dart';
import 'package:bookya/modules/settings/shared/network/local/cache_helper.dart';
import 'package:bookya/modules/settings/shared/styles/themes.dart';
import 'package:bookya/shared/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'modules/home/Data/HomeEndPoints.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.initialize();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  FinalDioHelper.init();
  bool? isDark = CacheHelper.getData(key: 'isDark');
  debugPrint('${isDark} isDark');
  Widget? widget;
   token = SharedPref.getToken()!;
   debugPrint(token);
  if(token ==''){
    widget = const BoardingScreen();
  }else{
    widget = const AllTabsScreen();
  }
  runApp(MyApp(isDark: isDark, startScreen: widget,));
}

class MyApp extends StatelessWidget {
  bool? isDark;
  Widget? startScreen;
  MyApp({Key? key, required this.isDark, this.startScreen}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) =>DarkModeBloc()..changeAppMode(fromShared: isDark)),
        BlocProvider(create: (context) => HomeCubit()..getHotels()),
        BlocProvider(create: (context) => RegisterBloc()),
        BlocProvider(create: (context) => SettingsBloc()),
        BlocProvider(create: (context) => FilterCubit()..getFacilities()),
        BlocProvider(
            create: (context) => MyBookingCubit()
              ..getBookingDataOngoing()
              ..getBookingDataCancelled()
              ..getBookingDataCompleted()),
      ],
      child: BlocConsumer<DarkModeBloc, DarkModeStates>(
        listener: (context, state) {
        },
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Bookya',
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: DarkModeBloc
                .get(context)
                .isDark ? ThemeMode.dark : ThemeMode.light,
            home: BoardingScreen(),
          );
        },
      ),
    );
  }
}

