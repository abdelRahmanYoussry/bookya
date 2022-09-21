import 'package:bookya/modules/boarding_pages/presentation/pages/boarding_screen.dart';
import 'package:bookya/modules/login/presentation/login_screen.dart';
import 'package:bookya/shared/shared_pref.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BoardingScreen(),
    );
  }
}

