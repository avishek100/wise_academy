// login_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view_model/login/login_bloc.dart';
import '../view_model/login/login_event.dart';
import '../view_model/login/login_state.dart';

class LoginView extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(),
      child: Scaffold(
        body: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginLoading) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) => const Center(child: CircularProgressIndicator()),
              );
            } else if (state is LoginSuccess) {
              Navigator.pop(context); // Close the loading dialog
              Navigator.pushNamed(context, '/welcome');
            } else if (state is LoginFailure) {
              Navigator.pop(context); // Close the loading dialog
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            }
          },
          child: SingleChildScrollView(
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
                          height: 270,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  buildTextField(
                      "Email", emailController, Icons.email, context),
                  const SizedBox(height: 16),
                  buildTextField("Password", passwordController, Icons.lock,
                      context, obscureText: true),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    onPressed: () {
                      context.read<LoginBloc>().add(LoginSubmitted());
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller,
      IconData icon, BuildContext context,
      {bool obscureText = false}) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return TextField(
          controller: controller,
          obscureText: obscureText,
          onChanged: (value) {
            if (label == "Email") {
              context.read<LoginBloc>().add(LoginEmailChanged(value));
            } else if (label == "Password") {
              context.read<LoginBloc>().add(LoginPasswordChanged(value));
            }
          },
          decoration: InputDecoration(
            prefixIcon: Icon(icon),
            labelText: label,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        );
      },
    );
  }
}
