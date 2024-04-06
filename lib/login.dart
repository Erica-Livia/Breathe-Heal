import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1_test/homepage.dart';
import 'package:flutter_application_1_test/signup.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

class Login extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      backgroundColor: Color.fromRGBO(
          172, 137, 124, 1.00), // Set screen background color to brown
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20.0),
                Column(
                  children: [
                    Text(
                      'B&H', // Title displayed at the top
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      'Breathe and Heal',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                SizedBox(
                  // Wrap the Card widget with SizedBox
                  width: 400.0, // Set max width to 400px
                  child: Card(
                    color: Colors.white, // Set card background color to white
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextField(
                            controller: emailController,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          TextField(
                            controller: passwordController,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            obscureText: true,
                          ),
                          SizedBox(height: 20.0),
                          SizedBox(
                            width: double
                                .infinity, // Set width to match the parent container
                            child: ElevatedButton(
                              onPressed: () {
                                _submitForm(context);
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  Color.fromRGBO(172, 137, 124, 100),
                                ),
                                textStyle: MaterialStateProperty.all<TextStyle>(
                                  TextStyle(fontSize: 18.0),
                                ),
                                padding: MaterialStateProperty.all<
                                    EdgeInsetsGeometry>(
                                  EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 15.0),
                                ),
                              ),
                              child: Text(
                                'Login', // Login
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          SizedBox(height: 10.0),
                          TextButton(
                            onPressed: () {
                              // Add your forgot password action here
                            },
                            child: Text('Forgot Password?'),
                          ),
                          SizedBox(height: 10.0),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Signup(), // Navigate to Signup screen
                                ),
                              );
                            },
                            child: Text('Sign Up'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submitForm(BuildContext context) {
    String email = emailController.text;
    String password = passwordController.text;

    FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .get()
        .then((QuerySnapshot querySnapshot) {
      if (querySnapshot.docs.isNotEmpty) {
        var user = querySnapshot.docs.first;
        var storedPassword = user['password'];
        print('Stored Password: $storedPassword');
        print('Hashed Password: ${hashPassword(password)}');
        if (storedPassword == hashPassword(password)) {
          // Passwords match, user logged in successfully
          // You can navigate to another screen or perform any other actions here
          print('User logged in successfully!');
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Homepage()),
          );
        } else {
          // Passwords don't match, display error message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Incorrect email or password.'),
              backgroundColor: Colors.red,
            ),
          );
        }
      } else {
        // No user with the provided email exists
        // Display error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('No user with this email exists.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }).catchError((error) {
      // Error occurred while querying Firestore
      print('Error querying Firestore: $error');
    });
  }

  String hashPassword(String password) {
    var bytes = utf8.encode(password); // Encode the password as UTF-8
    var digest =
        sha256.convert(bytes); // Hash the UTF-8 encoded password using SHA-256
    return digest.toString(); // Return the hashed password as a string
  }
}