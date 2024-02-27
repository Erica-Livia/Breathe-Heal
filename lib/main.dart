import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'homepage.dart';
import 'login.dart';
import 'signup.dart';
import 'welcome.dart';
import 'profile.dart';
import 'update.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'your_api_key',
      authDomain: 'your_auth_domain',
      databaseURL: 'your_database_url',
      projectId: 'your_project_id',
      storageBucket: 'your_storage_bucket',
      messagingSenderId: 'your_messaging_sender_id',
      appId: 'your_app_id',
      measurementId: 'your_measurement_id',
    ),
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Breathe and Heal',
      initialRoute: '/Homepage'
          '',
      routes: {
        '/': (context) => Welcome(),
        '/Signup': (context) => Signup(),
        '/Login': (context) => Login(),
        '/Homepage': (context) => Homepage(),
        '/Profile': (context) => ProfileApp(),
        '/Update': (context) => Update(),
      },
    );
  }
}
