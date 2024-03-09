import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'homepage.dart';
import 'login.dart';
import 'signup.dart';
import 'welcome.dart';
import 'profile.dart';
import 'update.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(Welcome());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Breathe and Heal',
      initialRoute: '/Homepage',
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
