// import 'package:flutter/material.dart';

// ThemeData getApplicationTheme() {
//   return ThemeData(
//     // primarySwatch: Colors.green,
//     scaffoldBackgroundColor: Colors.white,
//     fontFamily: 'Lato Bold',
//     elevatedButtonTheme: ElevatedButtonThemeData(
//       style: ElevatedButton.styleFrom(
//         textStyle: const TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//             fontFamily: ' Lato Regular'),
//         backgroundColor: Colors.blue,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(5),
//         ),
//       ),
//     ),
//   );
// }

import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Lato Bold',

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
          fontFamily: ' Lato Bold',
        ),
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    ),
  );
}
