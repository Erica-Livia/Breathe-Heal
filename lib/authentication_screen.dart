import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationScreen extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> _signInWithEmailPassword(BuildContext context) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: 'email@example.com', // Replace with user's email
        password: 'password123', // Replace with user's password
      );
      // Navigate to the home page or perform other actions after successful sign-in
      Navigator.pushReplacementNamed(context, '/home');
    } catch (e) {
      // Handle sign-in errors
      print('Error signing in with email and password: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to sign in. Please check your credentials.')),
      );
    }
  }

  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        UserCredential userCredential = await _auth.signInWithCredential(credential);
        // Navigate to the home page or perform other actions after successful sign-in
        Navigator.pushReplacementNamed(context, '/home');
      }
    } catch (e) {
      // Handle sign-in errors
      print('Error signing in with Google: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to sign in with Google.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Authentication'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => _signInWithEmailPassword(context),
              child: Text('Sign in with Email & Password'),
            ),
            SizedBox(height: 20.0),
            OutlinedButton(
              onPressed: () => _signInWithGoogle(context),
              child: Text('Sign in with Google'),
            ),
          ],
        ),
      ),
    );
  }
}
