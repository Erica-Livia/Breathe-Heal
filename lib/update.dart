import 'package:flutter/material.dart';

void main() {
  runApp(Update(onUpdateProfile: () {
    // Add functionality for updating profile
  }));
}

class Update extends StatelessWidget {
  final Function onUpdateProfile;

  Update({required this.onUpdateProfile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Update Profile',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Full Name',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                  border: Border.all(color: Colors.black),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Email',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                  border: Border.all(color: Colors.black),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Password',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                  border: Border.all(color: Colors.black),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  obscureText: true,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Profile Photo',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Center(
                child: Column(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey[300],
                        border: Border.all(color: Colors.black),
                      ),
                      child: Center(
                        child: Icon(Icons.person,
                            size: 40, color: Colors.grey[600]),
                      ),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        // Add functionality for changing photo
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        disabledBackgroundColor: Colors.black,
                      ),
                      child: Text('Change Photo'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Invoke the onUpdateProfile function when the button is pressed
                  onUpdateProfile();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromRGBO(172, 137, 124, 1)),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                ),
                child: Text('Update Profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
