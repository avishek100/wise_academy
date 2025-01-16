import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view_model/signup/signup_bloc.dart';
import '../view_model/signup/signup_event.dart';
import '../view_model/signup/signup_state.dart';


class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignUpBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sign Up'),
        ),
        body: BlocBuilder<SignUpBloc, SignUpState>(
          builder: (context, state) {
            final bloc = context.read<SignUpBloc>();

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    buildTextField(
                      'First Name',
                          (value) => bloc.add(FirstNameChanged(value)),
                    ),
                    const SizedBox(height: 15),
                    buildTextField(
                      'Last Name',
                          (value) => bloc.add(LastNameChanged(value)),
                    ),
                    const SizedBox(height: 15),
                    buildTextField(
                      'Email',
                          (value) => bloc.add(EmailChanged(value)),
                    ),
                    const SizedBox(height: 15),
                    buildTextField(
                      'Phone',
                          (value) => bloc.add(PhoneChanged(value)),
                    ),
                    const SizedBox(height: 15),
                    buildTextField(
                      'Password',
                          (value) => bloc.add(PasswordChanged(value)),
                      isPassword: true,
                    ),
                    const SizedBox(height: 15),
                    buildTextField(
                      'Confirm Password',
                          (value) => bloc.add(ConfirmPasswordChanged(value)),
                      isPassword: true,
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Checkbox(
                          value: state.isChecked,
                          onChanged: (value) {
                            bloc.add(TermsAcceptedChanged(value ?? false));
                          },
                        ),
                        const Text('Accept Terms & Conditions'),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        bloc.add(SubmitForm());
                        if (state.isFormValid) {
                          Navigator.pushNamed(context, '/login');
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Invalid form submission')),
                          );
                        }
                      },
                      child: const Text('Sign Up'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget buildTextField(String label, Function(String) onChanged,
      {bool isPassword = false}) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      onChanged: onChanged,
    );
  }
}
