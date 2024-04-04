import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'homepage.dart';
import 'login.dart';
import 'signup.dart';
import 'test.dart';
import 'test1.dart';
import 'welcome.dart';
import 'profile.dart';
import 'update.dart';
import 'authentication_screen.dart'; // Make sure to import the authentication_screen.dart

import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  runApp(MyApp(firebaseAuth: firebaseAuth));
}

class MyApp extends StatelessWidget {
  final FirebaseAuth firebaseAuth;

  MyApp({required this.firebaseAuth});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Breathe and Heal',
      initialRoute: '/Profile',
      routes: {
        '/': (context) => Welcome(),
        '/Signup': (context) => Signup(),
        '/Login': (context) => Login(),
        '/Homepage': (context) => Homepage(),
        '/Profile': (context) => ProfileApp(),
        '/Update': (context) => Update(onUpdateProfile: () {}),
        '/test': (context) => test(),
        '/test1': (context) => Test(),
        '/AuthenticationScreen': (context) => AuthenticationScreen(),
      },
    );
  }
}
