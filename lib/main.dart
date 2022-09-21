import 'package:bookya/settings/modules/explore_screen/page/explore_screen_home.dart';
import 'package:bookya/settings/shared/cubit/dark_mode_cubit.dart';
import 'package:bookya/settings/shared/cubit/dark_mode_states.dart';
import 'package:bookya/settings/shared/network/local/cache_helper.dart';
import 'package:bookya/settings/shared/styles/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'settings/modules/settings_option_page/cubit/cubit.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  
  late bool isDark = CacheHelper.getData(key: 'isDark');


  runApp(MyApp(isDark: isDark,));
}

class MyApp extends StatelessWidget {
  final bool isDark;
  const MyApp({Key? key,required this.isDark}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SettingsBloc()),
        BlocProvider(create: (context) => DarkModeBloc()..changeAppMode(
          fromShared: isDark,
        )),
      ],
      child: BlocConsumer<DarkModeBloc, DarkModeStates>(
        listener: (context, state) {
        },
        builder: (context, state) {
          DarkModeBloc cubit = DarkModeBloc.get(context);
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: cubit.isDark ? ThemeMode.dark : ThemeMode.light,
            home: const ExploreHomeScreen(),
          );
        },
      ),
    );
  }
}


