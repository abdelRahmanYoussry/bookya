import 'package:bookya/modules/settings/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
  import 'package:hexcolor/hexcolor.dart';

ThemeData darkTheme = ThemeData(
  //backgroundColor: HexColor('333739'),
  // HexColor('1a1a1a')
  scaffoldBackgroundColor: HexColor('#1a1a1a'),
  appBarTheme: AppBarTheme(
    centerTitle: true,
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    backwardsCompatibility: false,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
    backgroundColor: HexColor('#1a1a1a'),
    elevation: 0.0,
    titleTextStyle: const TextStyle(
      color: Colors.white,
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
    ),
  ),
  iconTheme: const IconThemeData(
    color: Colors.white,
  ),
  textTheme: TextTheme(
    bodyText1: const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 18.0,
      color: Colors.white,
    ),
    bodyText2: const TextStyle(
      fontSize: 27,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headline5: const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    subtitle1: const TextStyle(
      color: Colors.white,
      fontSize: 22,
      fontWeight: FontWeight.bold,
    ),
    caption: TextStyle(
      fontSize: 18.0,
      color: Colors.grey[100],
    ),
  ),
  primarySwatch: defaultColor,
);

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      systemNavigationBarIconBrightness: Brightness.dark,

    ),
    backgroundColor: Colors.white,
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
    ),
  ),
  primarySwatch: defaultColor,
  textTheme: TextTheme(
    bodyText1: const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 18.0,
      color: Colors.black,
    ),
    bodyText2: const TextStyle(
      fontSize: 27,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headline5: const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    subtitle1: TextStyle(
      color: Colors.grey[700],
      fontSize: 22,
      fontWeight: FontWeight.bold,
    ),
    caption: const TextStyle(
      fontSize: 18.0,
    ),
  ),
);