import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1_test/homepage.dart';
import 'package:flutter_application_1_test/login.dart';

void main() {
  runApp(ProfileApp());
}

class ProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(172, 137, 124, 1),
        appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
      ),
      home: ProfilePage(
        onEditProfile: () {
          Navigator.pushNamed(context, '/Update');
        },
      ),
      routes: {
        '/Homepage': (context) => HomePage(),
        '/Login': (context) => Login(),
      },
    );
  }
}

class ProfilePage extends StatelessWidget {
  final VoidCallback? onEditProfile;

  const ProfilePage({Key? key, this.onEditProfile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Account',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Color.fromRGBO(172, 137, 124, 1),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/logo.png'),
            ),
            SizedBox(height: 20),
            Text(
              'John Doe',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'john.doe@example.com',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: onEditProfile,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                foregroundColor: MaterialStateProperty.all(Colors.black),
              ),
              child: Text('Edit Profile'),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  height: 80,
                  color: Colors.white,
                  child: Center(
                    child: Text(
                      'Followers\n100',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Container(
                  width: 200,
                  height: 80,
                  color: Colors.white,
                  child: Center(
                    child: Text(
                      'Following\n50',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/Login');
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Color.fromRGBO(172, 137, 124, 1)),
                foregroundColor: MaterialStateProperty.all(Colors.white),
              ),
              child: Text('Sign Out'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/Homepage');
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                foregroundColor: MaterialStateProperty.all(Colors.red),
              ),
              child: Text('Delete Account'),
            ),
          ],
        ),
      ),
    );
  }
}
