import 'package:e_learning/features/auth/domain/usecases/login_student_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginStudentUsecase loginUseCase;

  LoginBloc(this.loginUseCase) : super(const LoginInitial()) {
    // Handle navigation to the Register screen
    on<NavigateRegisterScreenEvent>((event, emit) {
      _handleNavigationToRegisterScreen(event);
    });

    // Handle login
    on<LoginStudentEvent>(
      (event, emit) async {
        emit(const LoginLoading());

        final result = await loginUseCase(LoginStudentParams(
          email: event.email,
          password: event.password,
        ));

        result.fold(
          (failure) => emit(LoginError(message: failure.message)),
          (success) => emit(LoginSuccess()),
        );
      },
    );
  }

  void _handleNavigationToRegisterScreen(NavigateRegisterScreenEvent event) {
    Navigator.push(
      event.context,
      MaterialPageRoute(
        builder: (context) => event.destination,
      ),
    );
  }
}
