import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1_test/welcome.dart'; // Import the Welcome widget

void main() {
  testWidgets('Welcome screen UI test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Welcome(),
    ));

    // Verify that the AppBar title is empty
    expect(find.text(''), findsOneWidget);

    // Verify that the image is displayed
    expect(find.byType(Image), findsOneWidget);

    // Verify that the welcome message text is displayed
    expect(find.textContaining('Welcome to the Breath and Heal app'), findsOneWidget);

    // Verify that the Get Started button is displayed
    expect(find.text('Get Started'), findsOneWidget);

    // Tap on the Get Started button
    await tester.tap(find.text('Get Started'));
    await tester.pump();

  });
}