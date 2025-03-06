import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:e_learning/core/error/failure.dart';
import 'package:e_learning/features/auth/domain/usecases/login_student_usecase.dart';
import 'package:e_learning/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// ✅ Mock Dependencies
class MockLoginUseCase extends Mock implements LoginStudentUsecase {}

void main() {
  late MockLoginUseCase mockLoginUseCase;
  late LoginBloc loginBloc;

  setUp(() {
    mockLoginUseCase = MockLoginUseCase();
    loginBloc = LoginBloc(mockLoginUseCase);

    registerFallbackValue(const LoginStudentParams(email: '', password: ''));
  });

  group('LoginBloc Tests', () {
    const email = 'test@gmail.com';
    const password = 'password123';
    const loginParams = LoginStudentParams(email: email, password: password);

    blocTest<LoginBloc, LoginState>(
      'emits [LoginLoading, LoginSuccess] when login is successful',
      build: () {
        when(() => mockLoginUseCase.call(any())).thenAnswer((_) async =>
            const Right('Success')); // ✅ Fix: Return a String instead of null
        return loginBloc;
      },
      act: (bloc) =>
          bloc.add(const LoginStudentEvent(email: email, password: password)),
      expect: () => [
        const LoginLoading(),
        LoginSuccess(),
      ],
      verify: (_) {
        verify(() => mockLoginUseCase.call(loginParams)).called(1);
      },
    );

    blocTest<LoginBloc, LoginState>(
      'emits [LoginLoading, LoginError] when login fails',
      build: () {
        when(() => mockLoginUseCase.call(any())).thenAnswer((_) async =>
            const Left(ApiFailure(
                message: 'Invalid credentials'))); // ✅ Simulate failure
        return loginBloc;
      },
      act: (bloc) =>
          bloc.add(const LoginStudentEvent(email: email, password: password)),
      expect: () => [
        const LoginLoading(),
        const LoginError(message: 'Invalid credentials'),
      ],
      verify: (_) {
        verify(() => mockLoginUseCase.call(loginParams)).called(1);
      },
    );
  });

  tearDown(() {
    loginBloc.close();
  });
}
