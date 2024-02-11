import 'package:flutter/material.dart';
import 'homepage.dart';
import 'login.dart';
import 'signup.dart';
import 'welcome.dart';
import 'profile.dart';
import 'update.dart';

void main() {
  runApp(MyApp());
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
        '/Profile': (context) => Profile(),
        '/Update': (context) => Update(),
      },
    );
  }
}
