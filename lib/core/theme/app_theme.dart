import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Lato Bold',
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        fontSize: 16,
        fontFamily: 'Lato Regular',
      ), // Default for most text
    ),

    // Customizing the AppBar theme
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blue, // AppBar background color
      elevation: 4, // AppBar shadow
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20, // Title font size
        fontWeight: FontWeight.bold, // Title font weight
      ),
      iconTheme: IconThemeData(
        color: Colors.black, // Icon color in the AppBar
      ),
      actionsIconTheme: IconThemeData(
        color: Colors.black, // Icon color in actions
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontFamily: 'Lato Bold',
        ),
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedLabelStyle: TextStyle(
        fontFamily: 'Lato Regular', // Default for selected tab
      ),
      unselectedLabelStyle: TextStyle(
        fontFamily: 'Lato Regular', // Default for unselected tabs
      ),
    ),
  );
}
