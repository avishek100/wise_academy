import 'package:bloc_test/bloc_test.dart';
import 'package:e_learning/features/auth/presentation/view/login_view.dart';
import 'package:e_learning/features/auth/presentation/view/register_view.dart';
import 'package:e_learning/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// ✅ Mock RegisterBloc
class MockRegisterBloc extends Mock implements RegisterBloc {}

void main() {
  late MockRegisterBloc mockRegisterBloc;

  setUp(() {
    mockRegisterBloc = MockRegisterBloc();

    // ✅ Ensure Bloc emits states correctly
    whenListen(
      mockRegisterBloc,
      Stream.fromIterable([
        // ✅ FIXED: Ensure this exists too
      ]),
    );
  });

  Widget createTestableWidget() {
    return MaterialApp(
      home: BlocProvider<RegisterBloc>.value(
        value: mockRegisterBloc,
        child: const RegisterView(),
      ),
    );
  }

  group('RegisterView Widget Tests', () {
    testWidgets(
        'renders name, email, phone, password fields and Sign Up button',
        (WidgetTester tester) async {
      await tester.pumpWidget(createTestableWidget());

      expect(find.byKey(const Key('name')), findsOneWidget);
      expect(find.byKey(const Key('email')), findsOneWidget);
      expect(find.byKey(const Key('phone')), findsOneWidget);
      expect(find.byKey(const Key('password')), findsOneWidget);
      expect(find.byKey(const Key('signUpButton')), findsOneWidget);
    });

    testWidgets('validates incorrect inputs and shows error messages',
        (WidgetTester tester) async {
      await tester.pumpWidget(createTestableWidget());

      final nameField = find.byKey(const Key('name'));
      final emailField = find.byKey(const Key('email'));
      final phoneField = find.byKey(const Key('phone'));
      final passwordField = find.byKey(const Key('password'));
      final signUpButton = find.byKey(const Key('signUpButton'));

      await tester.enterText(nameField, ''); // Empty Name
      await tester.enterText(emailField, 'invalid-email'); // Invalid Email
      await tester.enterText(phoneField, '12345'); // Invalid Phone
      await tester.enterText(passwordField, '123'); // Short Password
      await tester.tap(signUpButton);
      await tester.pump();

      expect(find.text('Please enter Your Name'), findsOneWidget);
      expect(find.text('Enter a valid email'), findsOneWidget);
      expect(find.text('Enter a valid phone number'), findsOneWidget);
      expect(
          find.text('Password must be at least 8 characters'), findsOneWidget);
    });

    testWidgets('navigates to LoginView when Sign In button is tapped',
        (WidgetTester tester) async {
      await tester.pumpWidget(createTestableWidget());

      final signInButton = find.text('Sign In');
      await tester.tap(signInButton);
      await tester.pumpAndSettle(); // ✅ Ensure Navigation Completes

      expect(find.byType(LoginView), findsOneWidget);
    });
  });

  tearDown(() {
    mockRegisterBloc.close();
  });
}
