import 'package:bloc/bloc.dart';
import 'package:bookya/modules/boarding_pages/presentation/pages/boarding_screen.dart';
import 'package:bookya/modules/home/HomeCubit/BlocObserver.dart';
import 'package:bookya/modules/home/HomeCubit/home_cubit.dart';
import 'package:bookya/modules/register/domain/register_bloc.dart';
import 'package:bookya/modules/settings/modules/settings_option_page/cubit/cubit.dart';
import 'package:bookya/modules/settings/shared/cubit/dark_mode_cubit.dart';
import 'package:bookya/modules/settings/shared/network/local/cache_helper.dart';
import 'package:bookya/shared/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.initialize();
  Bloc.observer = MyBlocObserver();

  // late bool isDark = CacheHelper.getData(key: 'isDark');


  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  // final bool isDark;
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create:(context)=>HomeCubit()),
        BlocProvider(create: (context)=> RegisterBloc()),
        BlocProvider(create: (context) => SettingsBloc()),
        BlocProvider(create: (context) => DarkModeBloc()),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bookya',
        theme: ThemeData(
          primarySwatch: Colors.teal,
          backgroundColor: Colors.white,

        ),
        home: const BoardingScreen(),
      ),
    );
  }
}

