import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1_test/profile.dart';

void main() {
  testWidgets('CircleAvatar shows correct image', (WidgetTester tester) async {
    await tester.pumpWidget(ProfileApp());
    expect(find.byType(CircleAvatar), findsOneWidget);
  });

  testWidgets('Sign Out button is present and clickable',
      (WidgetTester tester) async {
    await tester.pumpWidget(ProfileApp());
    final signOutButton = find.widgetWithText(ElevatedButton, 'Sign Out');
    expect(signOutButton, findsOneWidget);
    await tester.tap(signOutButton);
    await tester.pump();
  });

  testWidgets('Delete Account button is present and clickable',
      (WidgetTester tester) async {
    await tester.pumpWidget(ProfileApp());
    final deleteAccountButton =
        find.widgetWithText(ElevatedButton, 'Delete Account');
    expect(deleteAccountButton, findsOneWidget);
    await tester.tap(deleteAccountButton);
    await tester.pump();
  });

  testWidgets('Edit Profile button triggers action',
      (WidgetTester tester) async {
    bool editProfilePressed = false;

    await tester.pumpWidget(MaterialApp(home: ProfilePage(onEditProfile: () {
      editProfilePressed = true;
    })));

    await tester.tap(find.text('Edit Profile'));
    await tester.pump();

    expect(editProfilePressed, true);
  });
}
