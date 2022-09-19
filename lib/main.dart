import 'package:bloc/bloc.dart';
import 'package:bookya/home/HomeCubit/home_cubit.dart';
import 'package:bookya/pages/Tabs_screen.dart';
import 'package:bookya/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/Observastion/BlocObserver.dart';

void main() {
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
      BlocProvider(create:(context)=>HomeCubit())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bookya',
        theme: ThemeData(
          primarySwatch: Colors.teal,
          backgroundColor: Colors.white,
        ),
        home: const AllTabsScreen(),
      ),
    );
  }
}


