import 'package:flutter/material.dart';

class Mytheme {
  static Color blackcolor = Color(0xff121312);
  static Color Goldcolor = Color(0xffFFBB3B);
  static Color Graycolor = Color(0xf707070);
  static Color BNBarcolor = Color(0xff1A1A1A);
  static Color whitecolor = Color(0xffFFFFFF);

  static ThemeData lightmode = ThemeData(
    primaryColor: blackcolor,
    scaffoldBackgroundColor: Colors.transparent,
    textTheme: TextTheme(
      titleLarge: TextStyle(
          fontSize: 22, fontWeight: FontWeight.bold, color: whitecolor),
      titleMedium: TextStyle(
          fontSize: 20, fontWeight: FontWeight.w400, color: whitecolor),
      titleSmall: TextStyle(
          fontSize: 15, fontWeight: FontWeight.w400, color: whitecolor),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: BNBarcolor,
        selectedItemColor: Goldcolor,
        showUnselectedLabels: true,
        selectedLabelStyle: TextStyle(
          fontSize: 10,
        ),
        unselectedLabelStyle: TextStyle(fontSize: 10, color: Graycolor),
        selectedIconTheme: IconThemeData(size: 25),
        unselectedIconTheme: IconThemeData(size: 22)),
  );
}
