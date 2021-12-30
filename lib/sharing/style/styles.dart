import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:new_app/sharing/style/colors.dart';

ThemeData lightTheme =ThemeData(
  textTheme: TextTheme(
      bodyText1: TextStyle(
          color: Colors.black,
          fontSize: 16.0,
          fontWeight: FontWeight.bold
      )
  ),
  primarySwatch: Colors.amber,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(
        color: Colors.black
    ),
    backgroundColor: Colors.white,
    elevation: 0.0,
    titleTextStyle: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: Colors.black
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: Colors.amber,
    type: BottomNavigationBarType.fixed,
  ),
) ;
ThemeData darkTheme = ThemeData(
  textTheme: TextTheme(
      bodyText1: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
          fontWeight: FontWeight.bold
      )
  ),
  primarySwatch: Colors.amber,
  scaffoldBackgroundColor: darkThemeMainColor,
  appBarTheme: AppBarTheme(
    backgroundColor: darkThemeMainColor,
    elevation: 0.0,
    titleTextStyle: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
    ),
    iconTheme: IconThemeData(
        color: Colors.white
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: darkThemeMainColor,
      statusBarIconBrightness: Brightness.light,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.amber,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      backgroundColor: darkThemeMainColor
  ),
);
