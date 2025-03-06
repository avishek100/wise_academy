import 'package:bloc_test/bloc_test.dart';
import 'package:e_learning/features/auth/presentation/view/login_view.dart';
import 'package:e_learning/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:e_learning/features/bottom_navigation/presentation/view/bottom_navigation_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// ✅ Mock LoginBloc
class MockLoginBloc extends MockBloc<LoginEvent, LoginState>
    implements LoginBloc {}

void main() {
  late MockLoginBloc mockLoginBloc;

  setUp(() {
    mockLoginBloc = MockLoginBloc();
  });

  Widget createTestableWidget() {
    return MaterialApp(
      home: BlocProvider<LoginBloc>.value(
        value: mockLoginBloc,
        child: const LoginView(),
      ),
    );
  }

  group('📌 LoginView Widget Tests', () {
    // ✅ Test: UI Elements
    testWidgets('renders email, password fields and login button',
        (WidgetTester tester) async {
      await tester.pumpWidget(createTestableWidget());

      expect(find.byKey(const Key('email')), findsOneWidget);
      expect(find.byKey(const Key('password')), findsOneWidget);
      expect(find.byKey(const Key('loginButton')), findsOneWidget);
    });

    // ✅ Test: Validate incorrect email & password
    testWidgets('shows validation errors for invalid email & short password',
        (WidgetTester tester) async {
      await tester.pumpWidget(createTestableWidget());

      // Enter invalid email
      await tester.enterText(find.byKey(const Key('email')), 'invalid-email');
      await tester.enterText(find.byKey(const Key('password')), '123');

      // Tap the login button
      await tester.tap(find.byKey(const Key('loginButton')));
      await tester.pump();

      // ✅ Expect validation messages to appear
      expect(find.text('Enter a valid email address'), findsOneWidget);
      expect(
          find.text('Password must be at least 8 characters'), findsOneWidget);
    });

    // ✅ Test: Successful Login
    testWidgets('navigates to BottomNavigationView on successful login',
        (WidgetTester tester) async {
      when(() => mockLoginBloc.stream).thenAnswer(
        (_) => Stream.fromIterable([const LoginLoading(), LoginSuccess()]),
      );

      await tester.pumpWidget(createTestableWidget());

      await tester.tap(find.byKey(const Key('loginButton')));
      await tester.pumpAndSettle();

      // ✅ Expect navigation to BottomNavigationView
      expect(find.byType(BottomNavigationView), findsOneWidget);
    });

    // ❌ Test: Failed Login (Invalid credentials)
    testWidgets('shows snackbar when login fails', (WidgetTester tester) async {
      whenListen(
        mockLoginBloc,
        Stream.fromIterable([
          const LoginLoading(),
          const LoginError(message: 'Invalid credentials'),
        ]),
      );

      await tester.pumpWidget(createTestableWidget());

      await tester.tap(find.byKey(const Key('loginButton')));
      await tester.pump(); // Let Bloc process

      // ✅ Expect Snackbar to appear
      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Invalid credentials'), findsOneWidget);
    });
  });

  tearDown(() {
    mockLoginBloc.close();
  });
}
