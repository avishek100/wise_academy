import 'package:flutter/material.dart';
import 'package:login_page/view/dashboard_page_view.dart';

// import 'package:login_page/view/loading_page_view.dart';
// import 'package:login_page/view/login_page_view.dart';
// import 'package:login_page/view/sign_up_page_view.dart';

// void main() {
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: LoginPageView(),
//     routes: {
//       '/signup': (context) => SignUpPageView(),
//     },
//   ));
// }

// import 'package:flutter/material.dart';
// import 'package:food_delivery_app/view/loading_page_view.dart';

// void main() {
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: LoginPageView(),
//     routes: {
//       '/signup': (context) => SignUpPageView(),
//     },
//   ));
// }

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const DashboardPageView(
              userName: 'abhishek',
            )
      },
    ),
  );
}
