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
import 'authentication_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
<<<<<<< HEAD
  runApp(Welcome());
=======
  runApp(MyApp()); // Use MyApp as the root widget of your app
>>>>>>> 32ff3252a92a2027d69682c4318f1fe1d277ed05
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Breathe and Heal',
<<<<<<< HEAD
      initialRoute: '/',
=======
      initialRoute: '/test',
>>>>>>> 32ff3252a92a2027d69682c4318f1fe1d277ed05
      routes: {
        '/': (context) => Welcome(),
        '/Signup': (context) => Signup(),
        '/Login': (context) => Login(),
        '/Homepage': (context) => Homepage(),
        '/Profile': (context) => ProfileApp(),
        '/Update': (context) => Update(),
        '/test': (context) => test(),
        '/test1': (context) => Test(),
        '/AuthenticationScreen': (context) => AuthenticationScreen(),
      },
    );
  }
}
