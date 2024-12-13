import 'package:flutter/material.dart';
import 'package:login_page/view/dashboard_page_view.dart';
import 'package:login_page/view/loading_page_view.dart';
import 'package:login_page/view/login_page_view.dart';
import 'package:login_page/view/sign_up_page_view.dart';
import 'package:login_page/view/welcome_page_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navigation Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/loading',
      routes: {
        '/loading': (context) => const LoadingPageView(),
        '/login': (context) => LoginPageView(),
        '/signup': (context) => const SignUpPageView(),
        '/dashboard': (context) => const DashboardPageView(
              userName: 'Abhishek',
            ),
        '/welcome': (context) => const WelcomePageView(),
      },
    );
  }
}
