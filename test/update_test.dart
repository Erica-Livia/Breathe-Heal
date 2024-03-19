import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1_test/update.dart';

void main() {
  testWidgets('Update Profile button triggers action',
      (WidgetTester tester) async {
    bool updateProfilePressed = false;

    // Build our Update screen and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: Update(
          onUpdateProfile: () {
            updateProfilePressed = true; // Set the flag to true when called
          },
        ),
      ),
    );

    // Tap the 'Update Profile' button and verify that action is triggered.
    await tester.tap(find.byType(ElevatedButton)); // Tap ElevatedButton widget
    await tester.pump(); // Wait for the frame to complete

    // Verify that action is triggered.
    expect(updateProfilePressed, true);
  });
}
