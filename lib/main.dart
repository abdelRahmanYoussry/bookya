import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../presentation/pages/tab_screen.dart';
import '../bloc/cubit.dart';
import '../data/network/helper/dio_helper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => MyBookingCubit()
                ..getBookingDataOngoing()
                ..getBookingDataCancelled()
                ..getBookingDataCompleted()),
        ],
        child: const MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          home: TabScreen(),
        ));
  }
}
