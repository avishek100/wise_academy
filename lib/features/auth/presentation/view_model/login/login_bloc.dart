// login_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginSubmitted) {
      yield LoginLoading();
      try {
        // Simulate a login process
        await Future.delayed(const Duration(seconds: 2));
        yield LoginSuccess();
      } catch (error) {
        yield LoginFailure(error.toString());
      }
    }
  }
}
