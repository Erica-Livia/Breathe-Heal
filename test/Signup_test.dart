import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Test Login Functionality', (WidgetTester tester) async {
    // Pump the MaterialApp widget
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            TextFormField(key: Key('email_field')),
            TextFormField(key: Key('password_field')),
            ElevatedButton(
              key: Key('login_button'),
              onPressed: () {
                // Perform login functionality here
                print('Login button pressed');
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    ));
    await tester.pumpAndSettle();

    // Enter text into TextFormField widgets
    await tester.enterText(find.byKey(Key('email_field')), 'john@example.com');
    await tester.enterText(find.byKey(Key('password_field')), 'password123');

    // Tap the Login button
    await tester.tap(find.byKey(Key('login_button')));
    await tester.pumpAndSettle();

    // Verify login functionality here
    // For example, check for navigation to the home page
    // expect(find.text('Home Page'), findsOneWidget);
  });
}
