// import 'package:dartz/dartz.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:wise_academy/core/error/failure.dart';
// import 'package:wise_academy/features/auth/domain/use_case/login_usecase.dart';

// import 'repository_mock.dart';
// import 'token_mock.dart';

// void main() {
//   late MockAuthRepository mockAuthRepository;
//   late MockTokenSharedPrefs mockTokenSharedPrefs;
//   late LoginUseCase loginUseCase;

//   setUp(() {
//     mockAuthRepository = MockAuthRepository();
//     mockTokenSharedPrefs = MockTokenSharedPrefs();
//     loginUseCase = LoginUseCase(mockAuthRepository, mockTokenSharedPrefs);

//     // Register fallback values (needed for mocktail)
//     registerFallbackValue(const LoginParams(email: '', password: ''));
//   });

//   group('LoginUseCase Tests', () {
//     const email = 'test@example.com';
//     const password = 'password123';
//     const token = 'mockToken';

//     test('should return token and save it when login is successful', () async {
//       // Arrange
//       when(() => mockAuthRepository.loginCustomer(email, password))
//           .thenAnswer((_) async => Right(token));
//       when(() => mockTokenSharedPrefs.saveToken(token))
//           .thenAnswer((_) async => Future.value());

//       // Act
//       final result = await loginUseCase(
//           const LoginParams(email: email, password: password));

//       // Assert
//       expect(result, Right(token));
//       verify(() => mockAuthRepository.loginCustomer(email, password)).called(1);
//       verify(() => mockTokenSharedPrefs.saveToken(token)).called(1);
//     });

//     test('should return failure when login fails', () async {
//       // Arrange
//       final failure = ApiFailure(message: "Login failed");
//       when(() => mockAuthRepository.loginCustomer(email, password))
//           .thenAnswer((_) async => Left(failure));

//       // Act
//       final result = await loginUseCase(
//           const LoginParams(email: email, password: password));

//       // Assert
//       expect(result, Left(failure));
//       verify(() => mockAuthRepository.loginCustomer(email, password)).called(1);
//       verifyNever(() => mockTokenSharedPrefs.saveToken(any()));
//     });
//   });
// }

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wise_academy/core/error/failure.dart';
import 'package:wise_academy/features/auth/domain/use_case/login_usecase.dart';

import 'repository_mock.dart';
import 'token_mock.dart';

void main() {
  late MockAuthRepository repository;
  late MockTokenSharedPrefs tokenSharedPrefs;
  late LoginUseCase usecase;

  setUp(() {
    repository = MockAuthRepository();
    tokenSharedPrefs = MockTokenSharedPrefs();
    usecase = LoginUseCase(repository, tokenSharedPrefs);

    // Mock getToken to return a valid token
    when(() => tokenSharedPrefs.getToken())
        .thenAnswer((_) async => const Right('mocked_token'));

    // Mock saveToken to return a successful response
    when(() => tokenSharedPrefs.saveToken(any()))
        .thenAnswer((_) async => const Right(null));
  });

  test(
      'should call the [AuthRepo.login] with correct email and password (abhishek, 1234)',
      () async {
    when(() => repository.loginCustomer(any(), any())).thenAnswer(
      (invocation) async {
        final email = invocation.positionalArguments[0] as String;
        final password = invocation.positionalArguments[1] as String;
        if (email == 'abhishek@gmail.com' && password == '1234') {
          return Future.value(const Right('token'));
        } else {
          return Future.value(
              const Left(ApiFailure(message: 'Invalid email or password')));
        }
      },
    );

    when(() => tokenSharedPrefs.saveToken(any()))
        .thenAnswer((_) async => const Right(null));

    when(() => tokenSharedPrefs.getToken())
        .thenAnswer((_) async => const Right('mocked_token'));

    final result = await usecase(const LoginParams(
      email: 'abhishek@gmail.com',
      password: '1234',
    ));

    expect(result, const Right('token'));

    verify(() => repository.loginCustomer(any(), any())).called(1);
    verify(() => tokenSharedPrefs.saveToken(any())).called(1);
    verify(() => tokenSharedPrefs.getToken())
        .called(1); // Explicitly verify this call

    verifyNoMoreInteractions(repository);
    verifyNoMoreInteractions(tokenSharedPrefs);
  });
}
