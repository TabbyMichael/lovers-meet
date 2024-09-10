import 'package:flutter/material.dart';

class AccountSettingsScreen extends StatefulWidget {
  @override
  _AccountSettingsScreenState createState() => _AccountSettingsScreenState();
}

class _AccountSettingsScreenState extends State<AccountSettingsScreen> {
  String username = 'JohnDoe'; // Fetch from Firebase
  String bio = 'Love traveling!'; // Fetch from Firebase

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Settings'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Picture Update
            Center(
              child: GestureDetector(
                onTap: () {
                  // Add function to select and update profile picture
                },
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                    'https://your-profile-pic-url.com', // Replace with Firebase storage link
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Username
            Text('Username'),
            TextFormField(
              initialValue: username,
              onChanged: (value) {
                setState(() {
                  username = value;
                });
              },
            ),
            SizedBox(height: 20),

            // Bio
            Text('Bio'),
            TextFormField(
              initialValue: bio,
              onChanged: (value) {
                setState(() {
                  bio = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
