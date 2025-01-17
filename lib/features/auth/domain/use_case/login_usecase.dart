import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery_application/app/usecase/usecase.dart';
import 'package:food_delivery_application/core/error/failure.dart';
import 'package:food_delivery_application/features/auth/domain/repository/auth_repository.dart';

class LoginParams extends Equatable {
  final String email;
  final String password;

  const LoginParams({
    required this.email,
    required this.password,
  });

  // Initial Constructor
  const LoginParams.initial()
      : email = '',
        password = '';

  @override
  List<Object> get props => [email, password];
}

class LoginUseCase implements UseCaseWithParams<String, LoginParams> {
  final IAuthRepository repository;

  LoginUseCase(this.repository);

  @override
  Future<Either<Failure, String>> call(LoginParams params) {
    // IF api then store token in shared preferences
    return repository.loginCustomer(params.email, params.password);
  }
}
