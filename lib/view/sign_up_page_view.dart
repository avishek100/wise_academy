import 'package:flutter/material.dart';

class SignUpPageView extends StatelessWidget {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool agreeToTerms = false;

  SignUpPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SIGN UP', style: TextStyle(color: Colors.black)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildTextField("First name", firstNameController),
              const SizedBox(height: 16),
              buildTextField("Last name", lastNameController),
              const SizedBox(height: 16),
              buildTextField("Email", emailController),
              const SizedBox(height: 16),
              buildTextField("Phone number", phoneNumberController,
                  keyboardType: TextInputType.phone),
              const SizedBox(height: 16),
              buildTextField("Password", passwordController, obscureText: true),
              const SizedBox(height: 16),
              buildTextField("Confirm password", confirmPasswordController,
                  obscureText: true),
              const SizedBox(height: 16),
              Row(
                children: [
                  Checkbox(
                    value: agreeToTerms,
                    onChanged: (value) {
                      agreeToTerms = value!;
                    },
                  ),
                  Expanded(
                    child: RichText(
                      text: const TextSpan(
                        text: "I agree to all ",
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                            text: "terms and conditions.",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
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
                  // Add your sign-up logic here
                  if (!agreeToTerms) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content:
                              Text("Please agree to terms and conditions")),
                    );
                  } else {
                    // Proceed with the sign-up process
                  }
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Sign In", style: TextStyle(fontSize: 18)),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_forward, size: 18),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller,
      {bool obscureText = false,
      TextInputType keyboardType = TextInputType.text}) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
