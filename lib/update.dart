import 'package:flutter/material.dart';

void main() {
  var yourUpdateProfileFunction;
  runApp(MaterialApp(home: Update(onUpdateProfile: yourUpdateProfileFunction)));
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
              // Other form fields
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
