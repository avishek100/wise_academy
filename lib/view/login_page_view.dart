import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPageView extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 50),
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/wise_academy_logo.png',
                      height: 300,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              buildTextField("Email", emailController, Icons.email),
              const SizedBox(height: 16),
              buildTextField("Password", passwordController, Icons.lock,
                  obscureText: true),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Add forgot password functionality here
                  },
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  // Simulate successful login and redirect to welcome page
                  Navigator.pushReplacementNamed(context, '/welcome');
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Login",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(width: 8),
                    Icon(
                      Icons.arrow_forward,
                      size: 18,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: "Create account",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, '/signup');
                          },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Row(
                children: [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text("or"),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              const SizedBox(height: 20),
              buildSocialButton(
                  "Login with Facebook", Colors.blue[900], Icons.facebook),
              const SizedBox(height: 10),
              buildSocialButton(
                  "Login with Google", Colors.red[700], Icons.g_mobiledata),
              const SizedBox(height: 10),
              buildSocialButton("Login with Apple", Colors.black, Icons.apple),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      String label, TextEditingController controller, IconData icon,
      {bool obscureText = false}) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }

  Widget buildSocialButton(String text, Color? color, IconData icon) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed: () {
        // Add social login functionality
      },
      icon: Icon(icon, color: Colors.white),
      label: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
