import 'package:bloc/bloc.dart';
import 'package:bookya/modules/boarding_pages/presentation/pages/boarding_screen.dart';
import 'package:bookya/modules/bookingStatus/bloc/cubit.dart';
import 'package:bookya/modules/bookingStatus/data/network/helper/dio_helper.dart';
import 'package:bookya/modules/home/HomeCubit/BlocObserver.dart';
import 'package:bookya/modules/home/HomeCubit/home_cubit.dart';
import 'package:bookya/modules/register/domain/register_bloc.dart';
import 'package:bookya/modules/settings/modules/settings_option_page/cubit/cubit.dart';
import 'package:bookya/modules/settings/shared/cubit/dark_mode_cubit.dart';
import 'package:bookya/modules/settings/shared/cubit/dark_mode_states.dart';
import 'package:bookya/modules/settings/shared/network/local/cache_helper.dart';
import 'package:bookya/modules/settings/shared/styles/themes.dart';
import 'package:bookya/shared/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.initialize();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  FinalDioHelper.init();
  bool? isDark = CacheHelper.getData(key: 'isDark');
  debugPrint(isDark.toString());
  runApp(MyApp(isDark: isDark));
}

class MyApp extends StatelessWidget {
  bool? isDark;
  MyApp({Key? key, required this.isDark}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) =>DarkModeBloc()..changeAppMode(fromShared: isDark)),
        BlocProvider(create: (context) => HomeCubit()..getHotels()),
        BlocProvider(create: (context) => RegisterBloc()),
        BlocProvider(create: (context) => SettingsBloc()),
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
            home: const BoardingScreen(),
          );
        },
      ),
    );
  }
}

