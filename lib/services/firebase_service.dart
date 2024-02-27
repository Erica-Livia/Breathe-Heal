import 'package:cloud_firestore/cloud_firestore.dart';

// Add data to the 'post' collection
void addPost(String content, String title, String publisherName, DateTime date) {
  FirebaseFirestore.instance.collection('post').add({
    'content': content,
    'title': title,
    'publisherName': publisherName,
    'date': date,
  });
}

// Add data to the 'user' collection
void addUser(String email, String name, String password) {
  FirebaseFirestore.instance.collection('user').add({
    'email': email,
    'name': name,
    'password': password,
  });
}

// Add data to the 'profile' collection
void addProfile(String email, String location, String name, String phoneNumber) {
  FirebaseFirestore.instance.collection('profile').add({
    'email': email,
    'location': location,
    'name': name,
    'phoneNumber': phoneNumber,
  });
}

// Example usage:
void main() {
  // Add a new post
  addPost(
    'Post Title',
    'This is the content of the post.',
    'John Doe',
    DateTime.now(),
  );

  // Add a new user
  addUser(
    'john@example.com',
    'John Doe',
    'password123',
  );

  // Add a new profile
  addProfile(
    'john@example.com',
    'New York',
    'John Doe',
    '123-456-7890',
  );
}
