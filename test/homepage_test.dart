import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_application_1_test/homepage.dart';

// Mock class for FirebaseFirestore
class MockFirestore extends Mock implements FirebaseFirestore {}

void main() {
  // Initialize Firebase app before running tests
  setUpAll(() async {
    await Firebase.initializeApp();
  });

  testWidgets('Homepage screen renders correctly', (WidgetTester tester) async {
    // Create a mock FirebaseFirestore instance
    final mockFirestore = MockFirestore();

    // Provide the mock instance to the HomePage widget
    await tester.pumpWidget(MaterialApp(
      home: HomePage(firestore: mockFirestore),
    ));

    // Verify that the app bar title is displayed
    expect(find.text('Event Posting'), findsOneWidget);

    // Verify that the 'Post an Event' text is displayed
    expect(find.text('Post an Event'), findsOneWidget);

    // Verify that the 'Event Name' and 'Event Description' fields are displayed
    expect(find.text('Event Name'), findsOneWidget);
    expect(find.text('Event Description'), findsOneWidget);

    // Verify that the 'Post Event' button is displayed
    expect(find.text('Post Event'), findsOneWidget);
  });

  testWidgets('Post Event button triggers action', (WidgetTester tester) async {
    // Create a mock FirebaseFirestore instance
    final mockFirestore = MockFirestore();

    // Provide the mock instance to the HomePage widget
    await tester.pumpWidget(MaterialApp(
      home: HomePage(firestore: mockFirestore),
    ));

    // Mock text editing controllers
    final eventNameController = TextEditingController();
    final eventDescriptionController = TextEditingController();

    // Enter text into the text fields
    await tester.enterText(
        find.byWidgetPredicate((widget) =>
            widget is TextField &&
            widget.decoration!.labelText == 'Event Name'),
        'Test Event');
    await tester.enterText(
        find.byWidgetPredicate((widget) =>
            widget is TextField &&
            widget.decoration!.labelText == 'Event Description'),
        'Test Description');

    // Tap the 'Post Event' button
    await tester.tap(find.text('Post Event'));

    // Verify that the _postEvent method is called with the correct parameters
    verify(mockFirestore.collection('events').add({
      'eventName': 'Test Event',
      'eventDescription': 'Test Description',
    })).called(1);
  });

  // Add more tests for other functionalities as needed
}
