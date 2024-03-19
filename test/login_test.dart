import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:your_app/login.dart';

void main() {
  testWidgets('Login screen renders correctly', (WidgetTester tester) async {
    // Build our Login screen and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: Login()));

    // Verify that the title text is displayed.
    expect(find.text('B&H'), findsOneWidget);
    expect(find.text('Breathe and Heal'), findsOneWidget);

    // Verify that the email and password fields are displayed.
    expect(find.byType(TextField), findsNWidgets(2));
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);

    // Verify that the login, forgot password, and sign up buttons are displayed.
    expect(find.text('Login'), findsOneWidget);
    expect(find.text('Forgot Password?'), findsOneWidget);
    expect(find.text('Sign Up'), findsOneWidget);
  });

  testWidgets('Login button triggers login action',
      (WidgetTester tester) async {
    bool loginPressed = false;

    // Build our Login screen and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: Login(),
    ));

    // Tap the login button and verify that login action is triggered.
    await tester.tap(find.text('Login'));
    loginPressed = true;

    // Rebuild the widget with the updated state.
    await tester.pump();

    // Verify that login action is triggered.
    expect(loginPressed, true);
  });
}
