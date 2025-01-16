import 'package:flutter/material.dart';

import '../features/auth/presentation/view/login_view.dart';
import '../features/auth/presentation/view/signup_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login and Sign Up',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/signup',
      routes: {
        '/signup': (context) => const SignUpView(),
        '/login': (context) =>
            LoginView(), // Replace with your LoginPage implementation
      },
    );
  }
}
