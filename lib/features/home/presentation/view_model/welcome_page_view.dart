import 'package:flutter/material.dart';

class WelcomePageView extends StatelessWidget {
  final String? userName;

  const WelcomePageView({super.key, this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Welcome'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to Wise Academy!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            if (userName != null)
              Text(
                'Hello, $userName!',
                style: const TextStyle(fontSize: 18),
              ),
            const SizedBox(height: 30),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/dashboard');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('Go to Home Page',
                    style: TextStyle(
                      color: Colors.white,
                    ))),
          ],
        ),
      ),
    );
  }
}
