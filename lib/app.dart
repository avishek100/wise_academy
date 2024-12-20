import 'package:flutter/material.dart';
import 'package:login_page/core/app_theme/app_theme.dart';
import 'package:login_page/view/dashboard_page_view.dart';
import 'package:login_page/view/loading_page_view.dart';
import 'package:login_page/view/login_page_view.dart';
import 'package:login_page/view/onboarding_page_view.dart';
import 'package:login_page/view/sign_up_page_view.dart';
import 'package:login_page/view/welcome_page_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // Start from OnboardingPage
      initialRoute: '/',
      theme: getApplicationTheme(),
      routes: {
        '/': (context) => const LoadingPageView(),
        '/onboarding': (context) => const OnboardingPageView(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => const SignUpPageView(),
        '/dashboard': (context) => const DashboardPageView(
              userName: 'Abhishek',
            ),
        '/welcome': (context) => const WelcomePageView(),
      },
    );
  }
}
