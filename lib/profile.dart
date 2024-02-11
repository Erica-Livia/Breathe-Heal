import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
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
              backgroundImage: AssetImage('assets/profile_pic.jpg'),
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
              onPressed: () {
                
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.black, 
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
                
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(172, 137, 124, 1),
                onPrimary: Colors.white,
              ),
              child: Text('Sign Out'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.red, 
              ),
              child: Text('Delete Account'),
            ),
          ],
        ),
      ),
    );
  }
}
