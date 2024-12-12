import 'package:flutter/material.dart';

class LoadingPageView extends StatelessWidget {
  const LoadingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App Logo
            Image.asset(
              'assets/images/wise_academy_logo.png',
              height: 100,
            ),
            const SizedBox(height: 20),
            // App Name and Tagline
            const Column(
              children: [
                Text(
                  'Wise Academy',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            // Progress Indicator
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
            ),
          ],
        ),
      ),
    );
  }
}
