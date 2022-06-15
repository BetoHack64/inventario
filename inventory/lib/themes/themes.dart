import 'package:flutter/material.dart';


class CustomThemes{
  ThemeData get mainTheme=>ThemeData(
      primaryColor: const Color(0xff00c5d0),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedLabelStyle: TextStyle(
            fontFamily: "Bradon",
          ),
          unselectedLabelStyle: TextStyle(
            fontFamily: "Bradon",
          )));

}